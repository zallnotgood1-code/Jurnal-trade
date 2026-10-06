-- OBSIDIAN TRADE JOURNAL
-- Run this once in Supabase SQL Editor.

create table if not exists public.trades (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  date date not null,
  time text,
  symbol text not null,
  market text,
  direction text check (direction in ('Long','Short')),
  strategy text,
  setup text,
  entry numeric,
  sl numeric,
  tp numeric,
  exit numeric,
  risk numeric,
  rr numeric,
  pnl numeric default 0,
  status text check (status in ('Win','Loss','Breakeven')),
  session text,
  emotion text,
  created_at timestamptz default now()
);

alter table public.trades enable row level security;

drop policy if exists "Users can view their own trades" on public.trades;
drop policy if exists "Users can insert their own trades" on public.trades;
drop policy if exists "Users can update their own trades" on public.trades;
drop policy if exists "Users can delete their own trades" on public.trades;

create policy "Users can view their own trades"
  on public.trades for select
  using (auth.uid() = user_id);

create policy "Users can insert their own trades"
  on public.trades for insert
  with check (auth.uid() = user_id);

create policy "Users can update their own trades"
  on public.trades for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "Users can delete their own trades"
  on public.trades for delete
  using (auth.uid() = user_id);

create index if not exists trades_user_date_idx on public.trades(user_id, date desc);
