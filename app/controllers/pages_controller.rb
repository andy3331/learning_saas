class PagesController < ApplicationController
  def home
    #creating instance variables for home page based on IDs in Plan table
    #will be able to use variable to reference the plans on the home page like we did:   (plan: @basic_plan.id) in:
    #<%= link_to "Sign up with Basic", new_user_registration_path(plan: @basic_plan.id), class: 'btn btn-primary btn-lg btn-block' %>
    #this causes query string parameters in the url 1 for basic 2 for pro. (ex: http://supersonic-ghost-77-219858.use1.nitrousbox.com/users/sign_up?plan=2)
    #this lets us configure the sign up form based on plan passed
    #Plan.all in rails console shows 1 is basic 2 is pro
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
  end
  def about
  end
end
