FactoryBot.define do
    factory :course do 
        name "excel"
        startdate "01-02-2018 10:10:10"
        enddate "02-02-2018 10:10:10"
    end

    factory :user do
        name "joe"
        lastname "do"
        email "j@j.com"
        password "1234"
    end

    factory :teacher do 
        user_id user
    end

    factory :group do
        name "test"
        key "kkk"
        teacher_id teacher
        course_id course
    end
end