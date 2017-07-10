require 'rails_helper'

describe Repo do
  it "it access all key information" do
    raw_repo = {
      name: "rales_engine",
      fork: true,
      description: "description",
      updated_at: "2017-05-24T20:08:31Z",
      language: "ruby",
      parent: {
        full_name: "adamgunther1/rales_engine",
        forks_count: 1
      }
    }

    repo = Repo.new(raw_repo)

    expect(repo.name).to eq("rales_engine")
    expect(repo.forked).to eq(true)
    expect(repo.description).to eq("description")
    expect(repo.updated_at).to eq("2017-05-24T20:08:31Z")
    expect(repo.parent_full_name).to eq("adamgunther1/rales_engine")
    expect(repo.language).to eq("ruby")
    expect(repo.forks).to eq(1)
  end
end