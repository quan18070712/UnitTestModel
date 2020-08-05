require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'first name invalid' do
    user = User.create(
      first_name: nil,
      last_name: "Quan",
      email: "quan.nguyen@gmail.com",
      password: '093979'
    )

    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")  
  end
  

  it 'last name invalid' do
    user = User.create(
      first_name: "Nguyen Truong Dinh",
      last_name: nil,
      email: "quan.nguyen@gmail.com",
      password: '093979'
    )

    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")  
  end

  it 'first name and last name invalid' do
    user = User.create(
      first_name: nil,
      last_name: nil,
      email: "quan.nguyen@gmail.com",
      password: '093979'
    )

    user.valid?
    expect(user.errors[:first_name] && user.errors[:last_name]).to include("can't be blank")
  end

  it 'first name and last name valid' do
    user = User.create(
      first_name: "Nguyen Truong Dinh",
      last_name: "Quan",
      email: "quan.nguyen@gmail.com",
      password: '093979'
    )

    user.valid?
    # expect(user.errors[:first_name] && user.errors[:last_name]).to eq []
    expect(user).to be_valid
  end

  it 'there are two emails co-exist' do
    user1 = User.create(
      first_name: "Nguyen Truong Dinh",
      last_name: "Quan",
      email: "quan.nguyen@gmail.com",
      password: '093979'
    )

    user2 = User.create(
      first_name: "Ho Anh",
      last_name: "Khiet",
      email: "quan.nguyen@gmail.com",
      password: '303737'
    )

    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it 'return full name' do
    user = User.create(
      first_name: "Nguyen Truong Dinh",
      last_name: "Quan",
      email: "quan.nguyen@gmail.com",
      password: '093979'
    )

    expect(user.name).to eq("Nguyen Truong Dinh Quan")
  end
end
