class Student < ActiveRecord::Base
  # name  :string
  # year  :integer
  # eq_id :text
  has_many :dol5_test_results
  has_many :gmit_test_results
  has_many :star_test_results
  has_many :ausidentities_test_results

  def year_level
    last_school_year_level = 12
    last_school_year_level - (Time.now.year - @year)
  end
  
  def has_been_fully_tested
  	true if dol5_test_results.any? and
  	  star_test_results.any? and
  	  gmit_test_results.any? and
  	  ausidentities_test_results.any?
  end
  
  def first_name
  	name.split(' ')[0]
  end
  
  def latest_dol5_test_result
  	dol5_test_results.first(:order => "id desc", :limit => 1)
  end
  
  def latest_gmit_test_result
  	gmit_test_results.first(:order => "id desc", :limit => 1)
  end
  
  def latest_star_test_result
  	star_test_results.first(:order => "id desc", :limit => 1)
  end
  
  def latest_ausidentities_test_result
  	ausidentities_test_results.first(:order => "id desc", :limit => 1)
  end
end

