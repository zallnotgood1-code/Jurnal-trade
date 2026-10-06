# OBSIDIAN Trade Journal

Premium dark trading journal built with React + Vite + Recharts + Supabase.

## Deploy from a phone

### 1. Create the database
1. Open Supabase in your mobile browser.
2. Create a new project.
3. Open **SQL Editor**.
4. Paste everything from `supabase_schema.sql` and run it.
5. Open **Project Settings -> API** and copy the Project URL and anon/public key.

### 2. Upload to GitHub
1. Open GitHub in your mobile browser.
2. Create a new repository.
3. Upload the files from this ZIP (keep the folder structure).
4. Commit the files.

### 3. Deploy on Netlify
1. Open Netlify.
2. Add new site -> Import an existing project -> GitHub.
3. Select this repository.
4. Build command: `npm run build`
5. Publish directory: `dist`
6. Add environment variables:
   - `VITE_SUPABASE_URL` = your Supabase Project URL
   - `VITE_SUPABASE_ANON_KEY` = your Supabase anon/public key
7. Deploy.

`netlify.toml` is already included, so Netlify can use the saved build settings.

## Local development

```bash
npm install
npm run dev
```

## Important

Never put a Supabase `service_role` key in the frontend. Only use the public/anon key in `VITE_SUPABASE_ANON_KEY`. Row Level Security in `supabase_schema.sql` keeps each user's trades private.

## Data behavior

- Without Supabase environment variables: the app uses browser localStorage as a fallback.
- With Supabase variables + authentication: trades are stored in the cloud and follow the logged-in user.
