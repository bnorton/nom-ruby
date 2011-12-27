# nom-ruby
    - The bindings for the Nom API in ruby

### Examples of the headless API
- https://justnom.it/locations/here.json?lat=37.7969398498535&lng=-122.399559020996
- https://justnom.it/activities.json?user_nid=4eccc0fbeef0a64dcf000001
- https://justnom.it/locations/search.json?lng=-122.3898&lat=37.81273&query=king

## Usage:
    @api_handle = Nom::API.new(:key => "your developer key")
    @user        = @api_handle.login('user_name or email', 'password')
    @locations   = @api_handle.here(:lat => 33.3, :lng => -122.2)
    @activities  = @api_handle.activities(:user_nid => '4eccc0fbeef0a64dcf000001')
    @api_handle.recommend(:text => 'I Just Nommed at ...', :user_nid => '4eccc0fbeef0a64dcf000001', :auth_token => '2af...fad3y')
    @api_handle.thumb(:location_nid => "4edgc0fbadf0a64dcf110037", :user_nid => '4eccc0fbeef0a64dcf000001', :auth_token => '2af...fad3y')

## All Success Results Take the Form:
    {
      "status": 1,
      "message": "OK",
      "results": [
        {"result": 1},
        {"result": 2},
        ...,
        {"result": "n"}
      ]
    }

## All Error Results Take the Form:
    {
      "status": -1,
      "message": "Some display-ready message about what the error was",
      "results": []
    }

## User:
    {
      name: "Brian Norton",
      city: "San Francisco",
      created_at: "2011-11-23T09:46:35Z",
      image_url: "https://graph.facebook.com/679816146/picture?type=large",
      updated_at: "2011-12-20T07:06:57Z",
      url: "http://justnom.it/users/bn",
      has_joined: true,
      follower_count: 16,
      user_nid: "4eccc0fbeef0a64dcf000001",
      screen_name: "bn"
    }
   
## Location:
    {
      name: "The Grove Cafe Yerba Buena",
      location_nid: "4ec8b964eef0a679f80005be",
      primary_category: "4ec8b8a7eef0a679f8000001",
      secondary_category: "4ec8b8cdeef0a679f8000151",
      cross_street: "Between 3rd St and Annie St",
      address: "690 Mission St San Francisco, CA 94105-4014",
      street: "690 Mission St",
      city: "San Francisco",
      state: "California"
      woeid: "12797156",
      rank_value: 38,
      gowalla_url: null,
      fsq_id: "4b7ef75cf964a520ee0c30e3",
      created_at: "2011-11-20T08:25:08Z",
      cost: "$$",
      updated_at: "2011-12-08T17:13:23Z",
      url: null,
      timeofday: "lunch | dinner",
      rank: "38/7821",
      phone: "415-957-0558",
      neighborhoods: "Financial District South",
      yid: "45199920"
    }
   
## Recommendation:
    {
      created_at: "2011-12-21T07:21:19Z",
      location: @location,
      title: null,
      token: "7LVSG",
      recommendation_nid: "4ef188efeef0a603e3000002",
      text: "I just Nommed @ Velvet Room justnom.it/r/7LVSG",
      user: @user,
      image: {
        size: "600x320#",
        url: "http://static.justnom.it/8e637e6585609c9df21577afc2b333dabeeb32c6.medium.png",
        image_nid: "4ee56d6beef0a61a7d000003"
      },
      lng: -122.41,
      lat: 37.7892
    }
  
## Thumb
    {
      user_nid: "4eccc137eef0a64dcf000002",
      created_at: "2011-12-21T05:03:22Z",
      location: @location,
      value: 1
    }
