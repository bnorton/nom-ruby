# nom-ruby
    - The bindings for the Nom API in ruby

### Examples of the headless API
- https://justnom.it/locations/here.json?lat=37.7969398498535&lng=-122.399559020996
- https://justnom.it/activities.json?user_nid=4eccc0fbeef0a64dcf000001
- https://justnom.it/locations/search.json?lng=-122.3898&lat=37.81273&query=king

###Getting Started
#####Dependencies:
- `json`
- `net/http`

#####Setup:
- `gem install nom-ruby`
- In an initializer `require 'nom-ruby'`
- Then just make the new API handle with `handle = Nom::API.new`

###Examples:

####Location (here):
``` ruby
    handle = Nom::API.new
    locations = handle.here(37.7969, -122.39955)
```

####Location (here - paginated to page 3):
``` ruby
    handle = Nom::API.new
    locations = handle.here(37.7969, -122.39955, {
      :start => 30,
      :limit => 15
    })
```

####Geolocation based search for 'vegetarian'
``` ruby
    handle = Nom::API.new
    locations = handle.location_search('vegetarian', {
      :lat => 37.7969,
      :lng => -122.39955
    })
```

####User search for 'team'
``` ruby
    handle = Nom::API.new
    users = handle.user_search('team')
    users = handle.user_search('test_accout@justnom.it')
```

####User registration (simple):
``` ruby
    handle = Nom::API.new
    user = handle.register('test_accout@justnom.it', 'a_password')
```

####User registration (with options):
``` ruby
    handle = Nom::API.new
    user = handle.register('test_accout@justnom.it', 'a_password', {
      :name => "The Nom Team",
      :city => 'San Francisco',
      :screen_name => 'team'
    })
```

####User Login (identifier and password based)
``` ruby
    handle = Nom::API.new
    user = handle.login('a_password', {:email => 'test_accout2@justnom.it'})
    user = handle.login('a_password', {:user_nid => '4efd9128eef0a63881000001'}) ## same user a above
```

####Yet Unimplemented
``` ruby
    #### Not yet implemented ####
    # activities = handle.activities(:user_nid => '4eccc0fbeef0a64dcf000001')
    # handle.recommend(:text => 'I Just Nommed at ...', :user_nid => '4eccc0fbeef0a64dcf000001', :auth_token => '2af...fad3y')
    # handle.thumb(:location_nid => "4edgc0fbadf0a64dcf110037", :user_nid => '4eccc0fbeef0a64dcf000001', :auth_token => '2af...fad3y')
    #############################
```

###Key For Response types:
- The `@` symbol is used to denote an entity unto itself. In the case of `@location` then in place you can logically expand a location object for `@location`. This is done for brevity.

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
      follower_count: 164,
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
