/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var ParentsAccountPage = {
  template: "#parents-account-page",
  data: function() {
    return {
      message: "ParentsAccountPage",
      id: "",
      firstName: "",
      lastName: "",
      email: "",
      phoneNumber: "",
      password: "",
      passwordConfirmation: "",
      errors: ""
    };
  },
  created: function() {
    axios.get("/parents/id").then(function(response) {
      let parent = response.data;
      this.id = parent.id
      this.firstName = parent.first_name;
      this.lastName = parent.last_name;
      this.email = parent.email;
      this.phoneNumber = parent.phone_number;

    }.bind(this)).catch(function(errors) {
      this.errors = errors.response.data
      console.log(errors.response.data.message);
    })
  },
  methods: {
    updateParent: function() {
      let params = {
        first_name: this.firstName,
        last_name: this.lastName,
        email: this.email,
        phone_number: this.phoneNumber,
      }
      if (this.password !== "") {
        params.password = this.password;
        params.password_confirmation = this.passwordConfirmation;
      }
      console.log(params);
      axios.patch("/parents/" + this.id, params).then(function(response) {
        console.log(response.data.message);
      }.bind(this)).catch(function(errors) {
        this.errors = errors.response.data.message;
      }.bind(this))
    }
  },
  computed: {}
};

var ParentsLocationPage = {
  template: "#parents-location-page",
  data: function() {
    return {
      message: "ParentsLocationPage",
      location: null
    };
  },
  created: function() {
    axios.get("/locations/id").then(function(response) {
      this.location = response.data;
    }.bind(this)).catch(function(errors) {
      console.log(errors.response.data.errors);
    })
  },
  methods: {

  },
  computed: {

  }
 }

var ParentsKidsPage = {
  template: "#parents-kids-page",
  data: function() {
    return {
      message: "ParentsKidsPage",
      id: "",
      kids: [],
      firstName: "",
      age: null
    };
  },
  created: function() {
    axios.get("/parents/id").then(function(response) {
      let parent = response.data;
      this.id = parent.id;
      this.kids = parent.kids;
    }.bind(this)).catch(function(errors) {
      console.log(errors.response.data.message);
    })
  },
  methods: {
    addKid: function() {
     let input = document.getElementById("newKid");
     input.style.display = "block";
    },
    createKid: function() {
      let params = {
        first_name: this.firstName,
        age: this.age
      }

      // creates a kid, or displays any errors that cause creation to fail
      axios.post("/kids", params).then(function(response) {
        this.kids.push(response.data);
      }.bind(this)).catch(function(errors) {
        console.log(errors.response.data.error);
      }.bind(this))

    }
  },
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      firstName: "",
      lastName: "",
      email: "",
      phoneNumber: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.firstName,
        last_name: this.lastName,
        email: this.email,
        phone_number: this.phoneNumber,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/parents", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/parent_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/parents/account", component: ParentsAccountPage },
    { path: "/parents/location", component: ParentsLocationPage },
    { path: "/parents/kids", component: ParentsKidsPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage},
    { path: "/logout", component: LogoutPage}

  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});
var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});