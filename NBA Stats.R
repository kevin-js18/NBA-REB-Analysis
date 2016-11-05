nba_all_url <- "http://stats.nba.com/stats/leaguedashplayerbiostats?LeagueID=00&Season=2015-16&SeasonType=Regular+Season&Height=&Name=&PerMode=PerGame"

nba_all_data <- fromJSON(nba_all_url)

nba_col_names <- unlist(nba_all_data$resultSet$headers)

nba_all_df <- data.frame(nba_all_data$resultSets$rowSet, stringsAsFactors = FALSE)

names(nba_all_df) <- nba_col_names

boxplot(as.numeric(nba_all_df$REB)~as.numeric(nba_all_df$PLAYER_HEIGHT_INCHES), xlab = "Height in Inches", ylab = "Rebounds per Game", main = "Relationship between Height and Rebounds per Game in the NBA")
mtext("2015 - 2016 Regular Season")

# FUTURE DEVELOPMENTS:

# Explore relationship between height and rebounding ability

# Figure out how why numeric columns are not being converted to numerics
