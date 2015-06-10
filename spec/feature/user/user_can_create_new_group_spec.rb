require 'rails_helper'


feature 'new watch group' do
  let!(:user) { User.create(uid: "123",
                            username: "Jack Nicholson",
                            email: "crazyman@email.com")
                            }

  let!(:movie)          { Movie.create(title: "Avatar",
                                       imdb_id: "12")
                                      }

  let!(:user_watchlist) { UserWatchlist.create(user_id: user.id,
                                               movie_id: movie.id)
                                               }

  it 'creates a new group with valid parameters' do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_groups_path(user)
    click_on "Create New Group"

    expect(current_path).to eq new_group_path

    fill_in "group[name]", with: "crazies"
    fill_in "group[description]", with: "supa crazies"
    click_button "Submit"

    expect(page).to have_css ".group-title"
  end
end
