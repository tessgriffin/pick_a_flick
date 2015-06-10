require 'rails_helper'

feature 'leave a group' do
  let!(:user)  { User.create(uid: "123",
                            username: "Jack Nicholson",
                            email: "crazyman@email.com")
                            }
  let!(:group) { Group.create(name: "The House of Cards",
                              description: "shaky foundation")}
  let!(:user_group) { UserGroup.create(user_id: user.id,
                                       group_id: group.id,
                                       active: true) }

  it 'allows user that belongs to group to leave group' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_groups_path
    
    expect(current_path).to eq(user_groups_path)
    expect(page).to have_content("The House of Cards")
    expect(page).to have_content("shaky foundation")

    click_button "Leave Group"
    expect(current_path).to eq(user_groups_path)
    expect(page).not_to have_content("The House of Cards")
    expect(page).not_to have_content("shaky foundation")
  end
end
