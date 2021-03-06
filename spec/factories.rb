# frozen_string_literal: true

FactoryBot.define do
  factory :article do

  end
  factory :space do

  end
  factory :event do

  end
  factory :groseries, class: "Grosery" do

  end
  factory :todo do

  end
  factory :publication do

  end
  factory :sentence do

  end
  factory :link do

  end
  factory :resource do

  end
  factory :like do

  end
  factory :comment do

  end
  factory :flyer do

  end
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

  factory :chat do
    user
    body "hello"
  end

  factory :teacher do
    user
  end

  factory :group do
    name "test"
    key "kkk"
    teacher
    course
  end


end
