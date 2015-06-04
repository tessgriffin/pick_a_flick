require 'rails_helper'

feature 'new watch group' do
  let!(:user)           { User.create(uid: "123",
                                      username: "Jack Nicholson",
                                      email: "crazyman@email.com")
                                      }

  let!(:group)          { Group.create(name: "crazies",
                                       description: "Jack Nicholson crazy")
                                       }

  let!(:movie)          { Movie.create(title: "Avatar",
                                       imdb_id: "12")
                                      }

  let!(:user_watchlist) { UserWatchlist.create(user_id: user.id,
                                               movie_id: movie.id)
                                               }

  it 'creates a new group with valid parameters' do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit group_path(group)

    expect(page).to have_css "#user-watchlist"
    page.check('title')
    click_on "Add to Group Watchlist"

    within(".group-watchlist") do
      expect(page).to have_content "Avatar"
    end
  end
end
