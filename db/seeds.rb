Kid.create!([
  {first_name: "Nala", age: 4, parent_id: 1},
  {first_name: "Lulu", age: 0, parent_id: 2},
  {first_name: "Nala", age: 4, parent_id: 2},
  {first_name: "Mika", age: 12, parent_id: 2},
  {first_name: "Cheech", age: 5, parent_id: 3},
  {first_name: "Chong", age: 5, parent_id: 3}
])
Location.create!([
  {address1: "312 Chicago St.", city: "Chicago", state: "IL", zip: 60025, parent_id: 1},
  {address1: "639 Forest Rd.", city: "GLENVIEW", state: "IL", zip: 60090, parent_id: 3}
])
Parent.create!([
  {first_name: "Ariel", last_name: "Klingsporn", email: "ariel@gmail.com", password_digest: "$2a$12$p9B.uRfBGEnlq18Lz7wlOuwisn3gSLyFYyWLbDihcWSdsvKBlekZi", phone_number: "847-219-0563"},
  {first_name: "Matthew", last_name: "Stone", email: "matt@gmail.com", password_digest: "$2a$12$EiV9m2kdFvgJVx9wQMemc.Sha8WFYDAMOCJxXn/5U4V6TxYer39qq", phone_number: "847-420-4201"},
  {first_name: "Jack", last_name: "Stone", email: "jack@gmail.com", password_digest: "$2a$12$c9JzqY1.VlQ1LfwgjSkrFuB1aVtrhQ6qBL./ll38haQSZ.kXF5d96", phone_number: "847-912-6958"}
])
User.create!([
  {email: "matt@gmail.com", password_digest: "$2a$12$6W.zG0cMkouOaI6viysdxecOZPzrbwrutHos7B1ZnXJu4m3/RhwkW", first_name: nil, last_name: nil, zip: nil},
  {email: "matty@gmail.com", password_digest: "$2a$12$x.ILKiK.aHtLNoigEvnvEONhH5rMG3IGpaAtiMNVAe.fWChoBi3VK", first_name: nil, last_name: nil, zip: nil},
  {email: "annie@gmail.com", password_digest: "$2a$12$jlPCEf0QGlgMF413GOfmkuIagdD37DdrTIHmKh6LosP46hNAEiL32", first_name: "Annie", last_name: "Stone", zip: nil},
  {email: "jim@gmail.com", password_digest: "$2a$12$yOBCWzT8VGxkyt9elSKYTegg4FwQ1l4BtBwNYOEoP3Xb8vQJQiwze", first_name: "Jim", last_name: "Mauer", zip: 60025}
])
