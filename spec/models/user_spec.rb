require 'rails_helper'

RSpec.describe User, type: :model do
  # before(:each) do
  #   @subject = User.create(first_name: "Bob", last_name: "Taylor", email: "test@test.com", password: "secretpass", password_confirmation: "secretpass")
  # end

  describe "Validations" do
    subject { User.new(first_name: "Bob", last_name: "Taylor", email: "test@test.com", password: "secretpass", password_confirmation: "secretpass") }

    it "should be valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "should not be valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid without a password_confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid if password doesn't match password_confirmation" do
      subject.password = "secret"
      subject.password_confirmation = "notsecret"
      expect(subject).to_not be_valid
    end
    it "should not be valid without a unique email address" do
      # existing_email = User.first.email
      user = User.create!(first_name: "John", last_name: "Smith", email: "test@test.com", password: "secretpass", password_confirmation: "secretpass")
      expect(subject).to_not be_valid
    end
    it "should not be valid if password is less than 5 characters" do
      subject.password = "not"
      subject.password_confirmation = "not"
      expect(subject).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    before(:each) do
      @new_user = User.create!(first_name: "John", last_name: "Smith", email: "test@test.test", password: "secretpass", password_confirmation: "secretpass")
    end

    it "should authenticate with valid credentials" do
      authenticated = User.authenticate_with_credentials("test@test.test", "secretpass")
      expect(authenticated).to eq(@new_user)
      puts User.all
    end

    it "should authenticate with an email surrounded by whitespace" do
      authenticated = User.authenticate_with_credentials("  test@test.test ", "secretpass")
      expect(authenticated).to eq(@new_user)
    end

    it "should authenticate with an email typed in uppercase" do
      authenticated = User.authenticate_with_credentials("  TEST@TEST.TEST ", "secretpass")
      expect(authenticated).to eq(@new_user)
      puts User.all
    end
  end
end
