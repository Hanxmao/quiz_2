# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :delete, to: :crud

    can :crud, Idea do |i|
      user == i.user
    end

    can :crud, Review do |r|
      user == r.user
    end

    can :like, Idea do |idea|
      user.persisted? && idea.user != user
    end

    can :destroy, Like do |like|
      like.user == user
    end
  end
end
