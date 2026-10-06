# ClientForge Mobile API Contract & Specification

## Executive Summary
This document locks the official API and authentication specification for the **ClientForge** Flutter mobile application and Next.js 15 backend. It serves as the single source of truth for Phase 7 implementation.

---

## 1. Locked Authentication Strategy

ClientForge uses a **Dual Transport Strategy** sharing a single, unified JWT session engine:

* **Web Browser**: Authenticates via signed HTTP-only `cf_session` cookie.
* **Flutter Mobile App**: Authenticates via `Authorization: Bearer <token>` header.

Both transports consume the exact same underlying `HS256` JWT signed with `process.env.SESSION_SECRET` via `jose`. No second user table, OAuth provider, or refresh-token database infrastructure is introduced. Existing web authentication remains 100% compatible.

---

## 2. Session Token Spec & Active User Rules

* **JWT Claims**:
  * `sub`: `AdminUser.id` (cuid string)
  * `email`: `AdminUser.email`
  * `name`: `AdminUser.name`
  * `iat`: Issued at timestamp
  * `exp`: Expiration timestamp (7 days / 604,800 seconds)
* **Active User Enforcement**:
  Cryptographic verification establishes token authenticity, but protected operations invoke `requireActiveUser()` or database lookup to verify `AdminUser.isActive === true`. Deactivated accounts are rejected immediately regardless of unexpired token signatures.

---

## 3. Auth Helper Contract (`src/lib/session.ts`)

`getSessionUser()` will be extended to inspect authentication in order of priority:
1. `Authorization: Bearer <token>` header in `headers()`.
2. `cf_session` cookie in `cookies()`.

### Helper Responsibilities:
* `getSessionUser()`: Extracts and verifies JWT payload. Returns `SessionUser | null`.
* `requireUser()`: Throws or redirects if unauthenticated.
* `requireActiveUser()`: Re-verifies Prisma `AdminUser.isActive === true`.

---

## 4. Login Contract (`POST /api/auth/login`)

### Request Payload:
```json
{
  "email": "agent@clientforge.io",
  "password": "yourpassword",
  "client": "mobile"
}
```

### Processing Logic:
* Rate Limiting: 8 attempts per 15 min per IP (`429 Too Many Requests`).
* Password Verification: `bcrypt.compare()` against `AdminUser.passwordHash`.
* `lastLoginAt` updated in Prisma.

### Response Contracts:
* **Mobile Request (`client: "mobile"`, `200 OK`)**:
  ```json
  {
    "ok": true,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "user": {
      "id": "clx123",
      "email": "agent@clientforge.io",
      "name": "Alex Morgan"
    }
  }
  ```
* **Web Request (no `client` parameter, `200 OK`)**:
  ```json
  { "ok": true, "redirect": "/dashboard" }
  ```
* **Error Responses**:
  * `400 Bad Request`: `{ "ok": false, "error": { "code": "INVALID_REQUEST", "message": "Enter a valid email and password." } }`
  * `401 Unauthorized`: `{ "ok": false, "error": { "code": "INVALID_CREDENTIALS", "message": "Incorrect email or password." } }`
  * `429 Too Many Requests`: `{ "ok": false, "error": { "code": "RATE_LIMITED", "message": "Too many attempts. Try again in 15 minutes." } }`

---

## 5. Current User Endpoint (`GET /api/mobile/auth/me`)

* **Headers**: `Authorization: Bearer <token>`
* **Success Response (`200 OK`)**:
  ```json
  {
    "ok": true,
    "user": {
      "id": "clx123",
      "email": "agent@clientforge.io",
      "name": "Alex Morgan"
    }
  }
  ```
* **Unauthenticated / Inactive (`401 Unauthorized`)**:
  ```json
  {
    "ok": false,
    "error": {
      "code": "UNAUTHORIZED",
      "message": "Authentication required or account inactive."
    }
  }
  ```

---

## 6. Mobile Logout Semantics

* Bearer JWTs are stateless.
* **Flutter Primary Logout**:
  1. Delete `clientforge_access_token` from `flutter_secure_storage`.
  2. Clear local Riverpod auth state.
  3. Navigate to `/login`.
* `POST /api/auth/logout` remains dedicated to clearing web browser cookies. Flutter does not call `/api/auth/logout`.

---

## 7. Token Expiry & Dio Interceptor Behavior

* **Token Lifetime**: 7 days.
* **Expiry Handling**:
  1. Server returns `401 Unauthorized`.
  2. Dio Auth Interceptor catches `401`.
  3. Removes `clientforge_access_token` from secure storage.
  4. Resets app state to unauthenticated and navigates to `/login`.

---

## 8. Flutter Secure Storage Contract

* **Storage Engine**: `flutter_secure_storage`
* **Key**: `clientforge_access_token`
* **Stored Value**: Raw JWT string only.
* **Security**: No passwords, secrets, or database URLs stored locally.

---

## 9. Mobile Dashboard Endpoint (`GET /api/mobile/dashboard`)

* **Headers**: `Authorization: Bearer <token>`
* **Response Body (`200 OK`)**:
  ```json
  {
    "ok": true,
    "leads": {
      "total": 124,
      "new": 42,
      "contacted": 38,
      "highPriority": 15,
      "confirmedNoWebsite": 28
    },
    "outreach": {
      "email": {
        "sentToday": 14,
        "sentThisWeek": 86,
        "receivedThisWeek": 12
      },
      "whatsapp": {
        "sentThisWeek": 24,
        "receivedThisWeek": 5
      }
    },
    "followUps": {
      "due": 6
    },
    "recentActivity": [
      {
        "id": "act123",
        "type": "EMAIL",
        "direction": "OUT",
        "title": "Email sent",
        "leadName": "ABC Dental",
        "status": "delivered",
        "createdAt": "2026-10-06T14:30:00.000Z"
      }
    ]
  }
  ```

---

## 10. Recent Activity Mobile DTO

```typescript
type MobileActivityDto = {
  id: string;
  type: string; // EMAIL | WHATSAPP | CALL | NOTE | STATUS
  direction: "IN" | "OUT";
  title: string;
  leadName: string;
  status: string | null;
  createdAt: string;
}
```

---

## 11. HIMI Contract (`POST /api/himi/chat`)

* **Headers**: `Authorization: Bearer <token>`
* **Standard Request**:
  ```json
  {
    "message": "Move ABC Dental to CONTACTED status",
    "history": [
      { "sender": "user", "text": "Hello" },
      { "sender": "himi", "text": "Hi! How can I help with your CRM today?" }
    ]
  }
  ```
* **Controlled Action Confirmation Request**:
  ```json
  {
    "confirmedPendingAction": {
      "action": "update_lead_status",
      "leadId": "clx456",
      "arguments": { "status": "CONTACTED" },
      "description": "Status: NEW → CONTACTED"
    }
  }
  ```
* **Action Cancellation Request**:
  ```json
  { "cancelPendingAction": true }
  ```

---

## 12. HIMI Health (`GET /api/himi/health`)

* **Status**: **EXISTING / OPTIONAL**
* **Headers**: `Authorization: Bearer <token>`
* **Response**: `{ "ok": true, "agent": "HIMI", "configured": true, "model": "gpt-4o" }`

---

## 13. Standard Error Response Format

```json
{
  "ok": false,
  "error": {
    "code": "UNAUTHORIZED",
    "message": "Authentication required or session expired."
  }
}
```

---

## 14. Base URL Strategy

* **Android Emulator Dev**: `http://10.0.2.2:3000`
* **iOS / Local Dev**: `http://localhost:3000`
* **Production**: `https://<clientforge-domain>.vercel.app` (configured in Flutter `AppConfig.baseUrl`).

---

## 15. CORS Assessment

Native Dio mobile requests bypass browser CORS restrictions. No global CORS wildcard required on backend routes.

---

## 16. Final Contract Table

| Endpoint | Method | Status | Auth Requirement | Purpose | Flutter V1 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `/api/auth/login` | `POST` | **ADAPT** | None | Login & return Bearer token | Required |
| `/api/mobile/auth/me` | `GET` | **NEW** | Bearer | Validate session & user profile | Required |
| `/api/mobile/dashboard` | `GET` | **NEW** | Bearer | Consolidated dashboard metrics | Required |
| `/api/himi/chat` | `POST` | **EXISTING** | Bearer / Cookie | HIMI AI chat & controlled actions | Required |
| `/api/himi/health` | `GET` | **EXISTING** | Bearer / Cookie | HIMI AI status check | Optional |
| `/api/auth/logout` | `POST` | **EXISTING** | Cookie | Destroy web cookie session | Web Only |

---

## 17. Phase 7 Backend Implementation Plan

1. **`src/lib/session.ts`**: Update `getSessionUser()` to read `Authorization: Bearer <token>` in addition to `cf_session` cookie.
2. **`src/app/api/auth/login/route.ts`**: Update `POST` handler to inspect `client: "mobile"` and return `token` & `user` JSON payload.
3. **`src/app/api/mobile/auth/me/route.ts`**: Create user profile validation endpoint.
4. **`src/app/api/mobile/dashboard/route.ts`**: Create mobile dashboard metrics endpoint.
5. **Validation**: Verify endpoints via `curl` / HTTP client testing before Flutter integration.
