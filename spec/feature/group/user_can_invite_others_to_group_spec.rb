require "rails_helper"

RSpec.describe "groups users" do
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


    it "when a member of the group" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit group_path(group.id)

      fill_in "user_group[email]", with: invited_user.email
      click_button "Submit"

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(invited_user)

      visit pending_invitations_path(invited_user.id)

      click_button "Accept Invitation"

      expect(group.users).to include(invited_user)
    end
  end
end
