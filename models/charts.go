package models

import (
	"encoding/json"
)

// Chart reprecents a helm chart with all avaible info
type Chart struct {
	Name        string       `json:"name"`
	Home        string       `json:"home"`
	Sources     []string     `json:"sources"`
	Version     string       `json:"version"`
	Description string       `json:"description"`
	Maintainers []Maintainer `json:"maintainers"`
	Engine      string       `json:"engine"`
	Icon        string       `json:"icon"`
	Urls        []string     `json:"urls"`
	Created     string       `json:"created"`
	Digest      string       `json:"digest"`
}

// Maintainer reprecents a chart maintainer
type Maintainer struct {
	Name  string `json:"name"`
	Email string `json:"email"`
}

// NewCharts unmarshals a slice of charts from Json
func NewCharts(data []byte) (map[string][]Chart, error) {
	var c map[string][]Chart
	err := json.Unmarshal(data, &c)
	return c, err
}
