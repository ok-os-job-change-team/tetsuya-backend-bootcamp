```mermaid
erDiagram

%% 1:0or多
Users ||--o{ Tweets: "1:n"
Users ||--o{ Favorites: "1:n"
Tweets ||--o{ Favorites: "1:n"

Users {
  INT id
  VARCHAR email
  VARCHAR password
  DATETIME created_at
  DATETIME updated_at
}

Tweets{
  INT id
  INT user_id
  VARCHAR title
  VARCHAR tweet_content
}

Favorites{
  INT id
  INT user_id
  INT tweet_id
}
```
