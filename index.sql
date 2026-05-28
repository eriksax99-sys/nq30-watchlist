-- Watchlist feature -- database setup
CREATE TABLE IF NOT EXISTS watchlists (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name       TEXT NOT NULL UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS watchlist_items (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  watchlist_id UUID NOT NULL REFERENCES watchlists(id) ON DELETE CASCADE,
  sym          TEXT NOT NULL,
  added_at     TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(watchlist_id, sym)
);

CREATE INDEX IF NOT EXISTS watchlist_items_watchlist_id_idx ON watchlist_items(watchlist_id);
CREATE INDEX IF NOT EXISTS watchlist_items_sym_idx ON watchlist_items(sym);
