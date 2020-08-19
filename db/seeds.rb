Parent.create!([
  {first_name: "Ariel", last_name: "Klingsporn", email: "ariel@gmail.com", password_digest: "$2a$12$p9B.uRfBGEnlq18Lz7wlOuwisn3gSLyFYyWLbDihcWSdsvKBlekZi", phone_number: "847-219-0563"},
  {first_name: "Matthew", last_name: "Stone", email: "matt@gmail.com", password_digest: "$2a$12$EiV9m2kdFvgJVx9wQMemc.Sha8WFYDAMOCJxXn/5U4V6TxYer39qq", phone_number: "847-420-4201"}
])
Location.create!([
  {address1: "312 Chicago St.", city: "Chicago", state: "IL", zip: 60025, parent_id: 1},
  {address1: "847 Glenview Rd.", city: "Glenview", state: "IL", zip: 60025, parent_id: 2}

])
User.create!([
  {email: "matt@gmail.com", password_digest: "$2a$12$6W.zG0cMkouOaI6viysdxecOZPzrbwrutHos7B1ZnXJu4m3/RhwkW", first_name: "Matthew", last_name: "Stone"},
  {email: "matty@gmail.com", password_digest: "$2a$12$x.ILKiK.aHtLNoigEvnvEONhH5rMG3IGpaAtiMNVAe.fWChoBi3VK", first_name: "Matty", last_name: "Stone"}
])
Kid.create!([
  {first_name: "Nala", age: 4, parent_id: 1},
  {first_name: "Lulu", age: 0, parent_id: 2},
  {first_name: "Nala", age: 4, parent_id: 2},
  {first_name: "Mika", age: 12, parent_id: 2}
])
