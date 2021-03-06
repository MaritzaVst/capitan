Rails.application.routes.draw do

  authenticate :user do

    get 'tracks/:id' => 'tracks#show_user_track', :as => :show_track
    get 'tracks/:track_id/courses/:id' => 'courses#show_details', :as => :course_details
    get 'tracks/:track_id/courses/:course_id/units/:unit_id/lessons/:id/' => "lessons#show", :as => :lesson_details
    get 'tracks/:track_id/courses/:course_id/units/:unit_id/lessons/:lesson_id/pages/:id' => "pages#show", :as => :lesson_page_details


    get 'mycourses/:course_id/u/:unit_id/l/:id' => 'lessons#show', :as => :mycourse_unit_lesson
    get 'mycourses/:course_id/u/:unit_id/l/:lesson_id/p/:id' => 'pages#show', :as => :mycourse_unit_lesson_page
    get 'codereview' => 'profile#codereview', :as => :codereview
    get 'myprofile(/:sprint_id)' => 'profile#myprofile', :as => :myprofile
    get 'codereview' => 'profile#codereview', :as => :code_review

    scope "/admin" do
      resources :questions
      resources :groups
      resources :users, except: [:index]
      resources :reviews
      resources :badges
      resources :soft_skills

      resources :sprints do
        get 'group/:group_id' => 'sprints#group_sprints', on: :collection
      end

      resources :tracks do
        resources :courses do
          resources :units do
            resources :lessons do
              resources :pages
            end
          end
        end
      end

      get 'dashboard' => 'dashboard#index', :as => :dashboard
      get 'grades(/branch/:branch_id)' => 'dashboard#grades', :as => :grades
      get 'grades/user/:user_id/course/:course_id' => 'dashboard#grade_details', :as => :grade_details
      get 'grades/activities' => 'dashboard#list_activities_scorables', :as => :activities
      get 'users(/branch/:branch_id)' => 'users#index', :as => :users_index
      get 'ranking(/:branch_id)' => 'users#ranking', :as => :ranking
      get 'ranking_detail/:id' => 'users#ranking_detail', :as => :ranking_detail
      get 'enrollments(/branch/:branch_id)' => 'dashboard#enrollments', :as => :enrollments
      post 'saveEnrollments' => 'dashboard#save_enrollments', :as => :saveEnrollments
      get 'page_visibility' => 'dashboard#page_visibility', :as => :page_visibility
      post 'saveVisibility' => 'dashboard#saveVisibility', :as => :saveVisibility
    end

    post 'saveAnswer' => 'pages#saveAnswer'
    post 'saveAnswers' => 'pages#saveAnswers'
    post 'saveQuestion' => 'pages#saveQuestion'

    post 'changeUserStatus' => 'users#change_user_status'

    root :to => 'tracks#show_user_track'
  end

  get 'admission' => 'profile#admission', :as => :admission
  get 'admission_success' => 'profile#admission_success', :as => :admission_success

  devise_for :users,
   path: "",
   path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "signup"
   },
   controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
end
