setwd("./")
data = read.csv("./data.csv")
ideology = data[, 2]
region = data[, 3]
ethnic = data[, 4]
gender = data[, 5]

##############################nan analysis
sum(!complete.cases(ideology))
sum(!complete.cases(region))
sum(!complete.cases(ethnic))
sum(!complete.cases(gender))

##############################statistic analysis
# ideology statistic analysis
mean_ = mean(ideology, na.rm = T)
median_ = median(ideology, na.rm = T)
range_ = max(ideology, na.rm = T) - min(ideology, na.rm = T)
std_ = sqrt(var(ideology, na.rm = T))
variation_ = std_ / mean_
q1 = quantile(ideology, 0.25, na.rm = T)
q3 = quantile(ideology, 0.75, na.rm = T)
distance = q3 - q1
a = matrix(c(mean_, median_, range_, std_, variation_, q1, q3, distance), 1, byrow = T)
colnames(a) = c("mean", "median", "range", "std", "variation", "1/4 quantile", "3/4 quantile", "distance")
print(a)

# region statistic analysis
mean_ = mean(region, na.rm = T)
median_ = median(region, na.rm = T)
range_ = max(region, na.rm = T) - min(region, na.rm = T)
std_ = sqrt(var(region, na.rm = T))
variation_ = std_ / mean_
q1 = quantile(region, 0.25, na.rm = T)
q3 = quantile(region, 0.75, na.rm = T)
distance = q3 - q1
a = matrix(c(mean_, median_, range_, std_, variation_, q1, q3, distance), 1, byrow = T)
colnames(a) = c("mean", "median", "range", "std", "variation", "1/4 quantile", "3/4 quantile", "distance")
print(a)

# ethnic statistic analysis
mean_ = mean(ethnic, na.rm = T)
median_ = median(ethnic, na.rm = T)
range_ = max(ethnic, na.rm = T) - min(ethnic, na.rm = T)
std_ = sqrt(var(ethnic, na.rm = T))
variation_ = std_ / mean_
q1 = quantile(ethnic, 0.25, na.rm = T)
q3 = quantile(ethnic, 0.75, na.rm = T)
distance = q3 - q1
a = matrix(c(mean_, median_, range_, std_, variation_, q1, q3, distance), 1, byrow = T)
colnames(a) = c("mean", "median", "range", "std", "variation", "1/4 quantile", "3/4 quantile", "distance")
print(a)

# gender statistic analysis
mean_ = mean(gender, na.rm = T)
median_ = median(gender, na.rm = T)
range_ = max(gender, na.rm = T) - min(gender, na.rm = T)
std_ = sqrt(var(gender, na.rm = T))
variation_ = std_ / mean_
q1 = quantile(gender, 0.25, na.rm = T)
q3 = quantile(gender, 0.75, na.rm = T)
distance = q3 - q1
a = matrix(c(mean_, median_, range_, std_, variation_, q1, q3, distance), 1, byrow = T)
colnames(a) = c("mean", "median", "range", "std", "variation", "1/4 quantile", "3/4 quantile", "distance")
print(a)

#########################Claim 1
# politically moderate: moderate 4,slightly 3 ,liberal 2,slightly conservative 5
# politically liberal: liberal 2,extremely liberal 7
# politically conservative:conservative 6,extremely conservative 7
total_num = length(ideology)
a = length(ideology[ideology == 4]) + length(ideology[ideology == 3]) + length(ideology[ideology == 2]) + length(ideology[ideology == 5]) 
politically_moderate = a / total_num
politically_moderate

a = length(ideology[ideology == 2]) + length(ideology[ideology == 7])
politically_liberal = a / total_num
politically_liberal

a = length(ideology[ideology == 6]) + length(ideology[ideology == 7])
politically_conservative = a / total_num
politically_conservative

#########################Claim 2
# South 3, Midwest 2, Northeast 1
south_mid = data[data[, "region"] == 3 | data[, "region"] == 2,]
north = data[data[, "region"] == 1,]
ideology_south_mid = south_mid[, 2]
ideology_north = north[, 2]
table(ideology_south_mid)/sum(table(ideology_south_mid))
table(ideology_north)/sum(table(ideology_north))

########################Claim 3
# man 1, woman 2
men = data[data[, "gender"] == 1,]
women = data[data[, "gender"] == 2,]
women
men
# men analysis
men_ideology = men[, 2]
women_ideology = women[, 2]
men_rst = table(men_ideology)/sum(table(men_ideology))
women_rst = table(women_ideology)/sum(table(women_ideology))
men_rst
women_rst
# correlation analysis
cor(men_ideology)
 
