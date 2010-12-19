var DateHelper = {
  time_ago_in_words_with_parsing: function(from) {
    var date = new Date();
    date.setTime(Date.parse(from));
    return this.time_ago_in_words(date);
  },

  time_ago_in_words: function(from) {
    return this.distance_of_time_in_words(new Date(), from);
  },

  distance_of_time_in_words: function(to, from) {
    var distance_in_seconds = ((to - from) / 1000);
    var distance_in_minutes = Math.floor(distance_in_seconds / 60);

    if (distance_in_minutes == 0) { return 'less than a minute ago'; }
    if (distance_in_minutes == 1) { return 'a minute ago'; }
    if (distance_in_minutes < 45) { return distance_in_minutes + ' minutes ago'; }
    if (distance_in_minutes < 90) { return 'about 1 hour ago'; }
    if (distance_in_minutes < 1440) { return 'about ' + Math.floor(distance_in_minutes / 60) + ' hours ago'; }
    if (distance_in_minutes < 2880) { return '1 day ago'; }
    if (distance_in_minutes < 43200) { return Math.floor(distance_in_minutes / 1440) + ' days ago'; }
    if (distance_in_minutes < 86400) { return 'about 1 month ago'; }
    if (distance_in_minutes < 525960) { return Math.floor(distance_in_minutes / 43200) + ' months ago'; }
    if (distance_in_minutes < 1051199) { return 'about 1 year ago'; }

    return 'over ' + Math.floor(distance_in_minutes / 525960) + ' years ago';
  }
};

var helpers = {
  price: function (price) {
      return "$" + Math.floor(price);
    },
  bedrooms: function (bedrooms) {
      if (bedrooms)
        return "(" + bedrooms + ")";
      else
        return "";
    },
  yes_or_no: function (test) {
      if (test === true)
        return "Yes";
      else if (test === false)
        return "No";
      else
        return "(unknown)";
    },
  extra_cost: function (cost_amount, cost_type) {
      return this.price(cost_amount) + cost_type;
    },
  extra_rent_and_deposit: function (rent, deposit) {
      if (!deposit && !rent)
        return "";

      var pieces = [];
      if (deposit)
        pieces.push(this.extra_cost(deposit, "dep"));
      if (rent)
        pieces.push(this.extra_cost(rent, "/mo"));

      return "(" + pieces.join("+") + ")";
    },
  extra_rent: function (rent) {
      if (!rent)
        return "";
      return "(" + this.extra_cost(rent, "/mo") + ")";
    },
  list: function (items) {
      if (!items)
        return "(none)";
    },
  edit_path: function (id) {
      return "/apartments/" + id + "/edit";
    },
  icon_url: function (score) {
      if (score === null) score = 0;
      return 'http://www.google.com/intl/en_us/mapfiles/ms/micons/' +
          ['red', 'pink', 'yellow', 'purple', 'blue', 'green'][score] + '.png';
    },
};
