nba_reb_url <- "http://stats.nba.com/stats/leagueleaders?LeagueID=00&PerMode=PerGame&Scope=S&Season=2015-16&SeasonType=Regular+Season&StatCategory=REB"

nba_reb_data <- fromJSON(nba_reb_url)

nba_reb_df <- data.frame(nba_reb_data$resultSet$rowSet, stringsAsFactors = FALSE)

typeof(nba_reb_df[[1]])

nba_col_names <- nba_reb_data$resultSet$headers

names(nba_reb_df) <- nba_col_names


convert_from_char <- function(x) {
  for(i in 1:length(nba_col_names)) {
    if (!is.na(as.numeric(nba_reb_df[ , nba_col_names[i]]))) {
        nba_reb_df[ , nba_col_names[i]] <- as.numeric(nba_reb_df[, nba_col_names[i]])
    }
  }
}

typeof(nba_reb_data$FT_PCT)

convert_from_factor(nba_col_names)

plot(as.numeric(as.character(nba_reb_df$REB)), as.numeric(as.character(nba_reb_df$FT_PCT)), main = "Rebounds per Game vs. Freethrow Percentage for Top 45 Rebounders", sub = "2015 - 2016 Regular Season", xlab = "Rebounds per Game", ylab = "Freethrow Percentage")

nba_reb_tbl <- as.tbl(nba_reb_df)

adjusted_tbl <- select(arrange(filter(nba_reb_tbl, FT_PCT > 0.6, REB > 8), desc(FT_PCT)), PLAYER, FT_PCT, REB)

arrange(mutate(adjusted_tbl, REB_FT_SCORE = as.numeric(REB)*as.numeric(FT_PCT)), desc(REB_FT_SCORE))


# FUTURE DEVELOPMENTS:

# Explore relationship between height and rebounding ability

# Refine Rebound/Freethrow score by determining what percent of rebounds per player leads to positive outcomes

# Figure out how why numeric columns are not being converted to numerics