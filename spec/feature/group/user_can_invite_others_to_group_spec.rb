require "rails_helper"

feature "groups users" do
  context "can invite others to join group" do
    let!(:user) { User.create(uid: "123",
                              username: "Jack Nicholson",
                              email: "crazyman@email.com")
                              }

    let!(:invited_user) { User.create(uid: "456",
                              username: "Jack Black",
                              email: "whitetunes@email.com")
                              }

    let!(:group)          { Group.create(name: "crazies",
                                         description: "Jack Nicholson crazy")
                                         }

    let!(:user_group)     { UserGroup.create(user_id: user.id, group_id: group.id)}


    it "when a member of the group" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_groups_path
      click_button "Accept Invite"
      click_link "Visit Group"
      fill_in "email", with: invited_user.email
      click_button "Submit"

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(invited_user)

      visit user_groups_path

      click_button "Accept Invite"

      expect(group.users).to include(invited_user)
    end
  end
end
