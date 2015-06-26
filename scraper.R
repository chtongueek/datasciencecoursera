url = "http://search.lockheedmartinjobs.com/ListJobs/ByState/CO/Country-US/"

ids = url %>%
  html() %>%
  html_nodes(".coldisplayjobid") %>%
  html_text()

IDs = data.frame(ids[2:length(ids)])
names(IDs) = ids[1]
IDs = gsub("[\r\n]", "", IDs[1:30,1])
IDs = gsub(' ', '', IDs)

bob = list()
for(j in 1:length(IDs)){
bob[[length(bob) + 1]] = html_session(url) %>%
  follow_link(i = IDs[j]) %>%
  html_nodes(".description .jobdescription-value") %>%
  html_text()
}

phrases = c("matlab", "python", "aerospace", "mechanical", "engineer", "modeling", "simulation", "data science", "math", "aerodynamics", " DOF ", "trajector", "missile", " r ")
weights = c(3, 1, 2, 2, 1, 2, 2, 2, 1, 2, 3, 2, 2, 2)
negs = c("electric", "manufactur", "software", "admin", "principal", "technician")
x2 = matrix(0,length(IDs),1)
x3 = x2
scores = data.frame(cbind(IDs, x2, x3)) 
names(scores) = c("IDs", "Score", "Fraction")
scores$Score = as.numeric(scores$Score)

for (i in 1:length(phrases)){
  
  success = which(grepl(phrases[i], bob, ignore.case = T))
  scores$Score[success] = scores$Score[success] + weights[i]
  
}

for (i in 1:length(negs)){
  
  fail = which(grepl(negs[i], bob, ignore.case = T))
  scores$Score[fail] = scores$Score[fail] - 1
  
}

scores$Fraction = round(scores$Score/sum(weights),2)

titles = url %>%
  html() %>%
  html_nodes(".coloriginaljobtitle") %>%
  html_text()

titles = gsub("[\r\n]", "", titles)
titles = gsub(' ', '', titles)
titles = tolower(titles)
