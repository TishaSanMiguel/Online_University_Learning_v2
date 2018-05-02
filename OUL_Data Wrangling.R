library(tidyverse)

# 1) Student Informaion: Who failed and who didn't
#Read
studentInfo <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_Capstone_Project/datasets/studentInfo.csv")
studentInfo %>% glimpse 
#select columns needed
studentInfo1 <- studentInfo %>% select(code_module, code_presentation, id_student, final_result)
sum(is.na(studentInfo$final_result))
sum(is.na(studentInfo$id_student))
#Check
studentInfo %>% summarise(nunq = n_distinct(id_student))
studentInfo %>% summarise(nunq = n_distinct(final_result))
studentInfo %>% count(id_student)
studentInfo %>% count(id_student) %>% filter(n > 1)
#change code_presentation
studentInfo2 <- studentInfo1 %>%
  mutate(code_presentation = gsub(pattern = "B", replacement = "February", x = code_presentation),
         code_presentation = gsub(pattern =  "J", replacement = "October", x = code_presentation))
studentInfo2 %>% glimpse

# 2) Distribution of Scores 
#Read
studentAssessment <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_Capstone_Project/datasets/studentAssessment.csv")
studentAssessment %>% glimpse
#select comlumns needed
studentAssessment1 <- studentAssessment %>% select(-date_submitted, -is_banked)
sum(is.na(studentAssessment$id_student))
sum(is.na(studentAssessment$score))
studentAssessment1 %>% glimpse
#173 without scores
#Check
studentAssessment %>% summarise(nunq = n_distinct(id_assessment))
studentAssessment %>% summarise(nunq = n_distinct(id_student))

# 3) How often students use the modules
#Read
studentVle <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_Capstone_Project/datasets/studentVle.csv")
studentVle %>% glimpse
#select comlumns needed
studentVle1 <- studentVle %>% select(-date, -id_site)
studentVle1 %>% glimpse
#Check
sum(is.na(studentVle))



# 4) Types of assessment used and when
#Read
assessments <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_Capstone_Project/datasets/assessments.csv")
assessments %>% glimpse
#select comlumns needed
assessments1 <- assessments %>% select(-id_assessment, -date)
#Check
sum(is.na(assessments))
#change presentation and assessment
assessments2 <- assessments1 %>%
  mutate(code_presentation = gsub(pattern = "B", replacement = "February", x = code_presentation),
         code_presentation = gsub(pattern =  "J", replacement = "October", x = code_presentation),
         assessment_type = gsub(pattern = "TMA", replacement = "Tutor Marked Assessment", x = assessment_type),
         assessment_type = gsub(pattern = "CMA", replacement = "Computer Marked Assessment", x = assessment_type),
         assessment_type = gsub(pattern = "Exam", replacement = "Final Exam", x = assessment_type))
assessments2 %>% glimpse



