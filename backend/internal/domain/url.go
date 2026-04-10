package domain

import "time"

type URL struct {
	ID         int
	ShortCode  string
	LongURL    string
	UserID     int
	CreatedAt  time.Time
	ExpiresAt  *time.Time
	ClickCount int
}

type URLResponse struct {
	ID         int        `json:"id"`
	ShortCode  string     `json:"short_code"`
	LongURL    string     `json:"long_url"`
	UserID     int        `json:"user_id"`
	CreatedAt  time.Time  `json:"created_at"`
	ExpiresAt  *time.Time `json:"expires_at,omitempty"`
	ClickCount int        `json:"click_count"`
}

type LongURL struct {
	LongURL string `json:"longURL"`
}

type ShortCode struct {
	ShortCode string `json:"shortCode"`
}
