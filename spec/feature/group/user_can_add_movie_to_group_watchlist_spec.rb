require 'rails_helper'

feature 'new watch group' do
  let!(:user)           { User.create(uid: "123",
                                      username: "Jack Nicholson",
                                      email: "crazyman@email.com")
                                      }

  let!(:group)          { Group.create(name: "crazies",
                                       description: "Jack Nicholson crazy")
                                       }

  let!(:user_group)     { UserGroup.create(user_id: user.id, group_id: group.id)}

  let!(:movie)          { Movie.create(title: "Avatar",
                                       imdb_id: "12")
                                      }

  let!(:user_watchlist) { UserWatchlist.create(user_id: user.id,
                                               movie_id: movie.id)
                                               }

  it 'creates a new group with valid parameters' do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_groups_path(group)

    click_button "Accept Invite"
    click_link "Visit Group"
    expect(page).to have_css ".user_dashboard_watchlist"

    page.check('group[movie_ids][]')
    click_on "Add Vote List"

    within(".group-watchlist") do
      expect(page).to have_content "Avatar"
    end
  end
end
