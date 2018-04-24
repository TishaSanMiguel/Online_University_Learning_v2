library(tidyverse)

#Student Informaion: Who failed and who didn't

studentInfo <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_Capstone_Project/datasets/studentInfo.csv")
is.na(studentInfo)
any(is.na(studentInfo))
sum(is.na(studentInfo))
#drop gender, region, education, band, age, attempts, credits, disability
studentInfo1 <- studentInfo %>% select(code_module, code_presentation, id_student, final_result)
#change code_presentation
studentInfo2 <- studentInfo1 %>%
  mutate(code_presentation = gsub(pattern = "B", replacement = "February", x = code_presentation),
         code_presentation = gsub(pattern =  "J", replacement = "October", x = code_presentation))
studentInfo2 %>% glimpse

#Would like to be ale to use summarise for the following

studentInfo3 <- filter(studentInfo2, final_result == "Pass") %>% 
  summarise(sum_pass = sum(final_result == "Pass"))
studentInfo3 %>% glimpse
#12,361 students passed
studentInfo4 <- filter(studentInfo2, final_result == "Fail") %>% 
  summarise(sum_pass = sum(final_result == "Fail"))
studentInfo4 %>% glimpse
#7,052 students failed
studentInfo5 <- filter(studentInfo2, final_result == "Withdrawn") %>% 
  summarise(sum_pass = sum(final_result == "Withdrawn"))
studentInfo5 %>% glimpse
#10,156 students withdrew

#Distribution of Scores 

studentAssessment <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_Capstone_Project/datasets/studentAssessment.csv")
is.na(studentAssessment)
any(is.na(studentAssessment))
sum(is.na(studentAssessment))
#remove date and banked 
studentAssessment1 <- studentAssessment %>% select(-date_submitted, -is_banked)
hist(studentAssessment$score)
studentAssessment1 %>% glimpse
studentAssessment1 %>% filter(score <= 40) %>% summarise(sum_below_40 = sum(score <= 40))
#9544 students did not make the 40% cutoff

#How often students use the modules

studentVle <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_Capstone_Project/datasets/studentVle.csv")
studentVle %>% glimpse
is.na(studentVle)
any(is.na(studentVle))
sum(is.na(studentVle))
studentVle1 <- studentVle %>% select(-date)
studentVle1 %>% dim
studentVle1 %>% arrange(sum_click)
plot(studentVle$sum_click)

#Types of assessment used and when

assessments <- read_csv("C:/Users/tishas/Desktop/personal/Springboard/exercises/Springboard_Capstone_Project/datasets/assessments.csv")
assessments %>% glimpse
is.na(assessments)
any(is.na(assessments))
sum(is.na(assessments))
assessments1 <- assessments %>%
  mutate(code_presentation = gsub(pattern = "B", replacement = "February", x = code_presentation),
         code_presentation = gsub(pattern =  "J", replacement = "October", x = code_presentation),
         assessment_type = gsub(pattern = "TMA", replacement = "Tutor Marked Assessment", x = assessment_type),
         assessment_type = gsub(pattern = "CMA", replacement = "Computer Marked Assessment", x = assessment_type),
         assessment_type = gsub(pattern = "Exam", replacement = "Final Exam", x = assessment_type))
assessments1 %>% glimpse






