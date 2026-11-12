-- Study Battle: Supabase SQL Editor에서 한 번 실행하세요.
create table if not exists public.rooms (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  host_id uuid not null references auth.users(id) on delete cascade,
  host_name text not null,
  guest_id uuid references auth.users(id) on delete set null,
  guest_name text,
  status text not null default 'waiting' check (status in ('waiting','ready','finished')),
  created_at timestamptz not null default now()
);
alter table public.rooms enable row level security;
create policy "Signed-in users can read waiting or joined rooms"
on public.rooms for select to authenticated
using (true);
create policy "Users can create their own rooms"
on public.rooms for insert to authenticated
with check (auth.uid() = host_id);
create policy "Room participants can update rooms"
on public.rooms for update to authenticated
using (auth.uid() = host_id or auth.uid() = guest_id or (guest_id is null and status = 'waiting'))
with check (auth.uid() = host_id or auth.uid() = guest_id);
alter publication supabase_realtime add table public.rooms;
