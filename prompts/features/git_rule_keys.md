# Map API Keys and Secrets – Security Rules

Act as an application security engineer.

When implementing map functionality, follow these rules:

## API key protection
1. Never hardcode secret API keys in source code.
2. Never commit API keys to GitHub.
3. Never expose server-side API keys in frontend.
4. Store private keys in environment variables or a secure secrets manager.
5. Add .env, .env.local, and other secret files to .gitignore.
6. Provide only placeholder values in .env.example.

## Browser map keys
Some map providers require public browser keys.

For these keys:
- Treat them as publicly visible.
- Restrict keys to authorized HTTP referrers or application origins.
- Enable only the required APIs.
- Apply quota and billing limits.
- Never treat frontend environment variables as secret storage.
- Use separate keys for development, staging, and production.

## Backend keys
- Keep server-side credentials exclusively on the backend.
- Never return secret credentials through API responses.
- Use minimum required permissions.
- Rotate exposed credentials immediately.

## Git protection
Before every commit:
- Scan staged files for API keys and credentials.
- Check Git history for accidentally committed secrets.
- Inspect .gitignore.
- Verify no private configuration files are staged.

## Map implementation
- Follow the provider's official SDK and security documentation.
- Do not invent API endpoints or authentication methods.
- Handle map loading errors.
- Avoid exposing unnecessary location data.
- Do not log credentials or sensitive user coordinates.

## Final verification
Report:
- Which keys are public and which are private.
- Where each key is stored.
- Which APIs are enabled.
- Which restrictions are configured.
- Whether any credentials were detected in Git history.

Never claim a key is secure without verifying its restrictions.