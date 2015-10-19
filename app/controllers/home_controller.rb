require 'httparty'

class HomeController < ApplicationController

  def index
    users
    volunteers
    organizations
    projects
    gifts
    donors
  end

  def profile
    retrieve_profile
  end

  private

  def users
    @users_result = HTTParty.get('http://localhost:3001/users')["data"]
  end

  def donors
    @donors_count = 0
    @users_result.each do |user|
      if user["donor"] == true
        @donors_count += 1
      end
    end
  end

  def volunteers
    @volunteers_result = HTTParty.get('http://localhost:3001/volunteers')["data"]
    @volunteers_count = @volunteers_result.count
    @volunteers_pending = HTTParty.get('http://localhost:3001/volunteers/pending')["data"]
  end

  def organizations
    @organizations_result = HTTParty.get('http://localhost:3001/organizations')["data"]
    @organizations_count = @organizations_result.count
  end

  def projects
    @projects_result =  HTTParty.get('http://localhost:3001/projects')["data"]
    @projects_pending =  HTTParty.get('http://localhost:3001/projects/pending')["data"]
    @projects_approved =  HTTParty.get('http://localhost:3001/projects/pending')["data"]
    @projects_approved_count = @projects_approved.count
    @projects_funded =  HTTParty.get('http://localhost:3001/projects/funded')["data"]
    @projects_funded_count = @projects_funded.count
  end

  def gifts
    @gifts_result = HTTParty.get('http://localhost:3001/gifts')["data"]
    @donations_count = @gifts_result.count
    total_gifted
  end

  def total_gifted
    @total_gifted = 0
    @gifts_result.each do |gift|
      if gift["status"] == "approved"
        @total_gifted += gift["amount"]
      end
    end
  end

  # def retrieve_profile =
  #   @user_result = HTTParty.get('http://localhost:3001/user/:id')
  # end
end
