--DML
Insert into t_grade (grade_no, grade_name) values (seq_grade.nextval, '초보 방랑자');
Insert into t_grade (grade_no, grade_name) values (seq_grade.nextval, '낭만 여행가');
select * from t_grade;

Insert into t_theme (theme_no, theme_name, theme_content) values (seq_theme.nextval, '테마1', '테마1 소개글');
Insert into t_theme (theme_no, theme_name, theme_content) values (seq_theme.nextval, '테마2', '테마2 소개글');
Insert into t_theme (theme_no, theme_name, theme_content) values (seq_theme.nextval, '테마3', '테마3 소개글');