require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def test_a_date_returns_a_list_of_neos
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2011 GE3)', results[:astroid_list][0][:name]
  end

  def test_asteriods_list_data_helper
   results = NearEarthObjects.asteroids_list_data('2019-03-30')
   assert_equal Faraday::Response, results.class
   assert_equal String, results.body.class
  end

  def test_parsed_asteriods_list_data_helper
   asteroids_list_data = NearEarthObjects.asteroids_list_data('2019-03-30')
   results = NearEarthObjects.parsed_asteroids_data(asteroids_list_data, '2019-03-30')
   assert_equal Array, results.class
   assert_equal Hash, results.first.class
   assert_equal '(2011 GE3)', results[0][:name]
  end
end
