# Entities List [XML](./Entities.xml) [SQL](./Entities.sql)

## Entities
1. Address
 - Unit #
 - Street Address
 - City
 - Province / State / Region
 - Country
 - Postal Code
2. User
 - Password(Hashed)
 - Hash Salt
 - Email
    - Verification key (for validating)
    - Was it verified? 
    - Allows marketing?
 - Phone Number
 - Display Name
 - Gender
 - Full Name
 - Date of Birth
 - Friends
 - Stripe Email
 - Stripe ID
 - verification key
3. Credit Card
 - Number
 - CVV
 - Expiration
4. Game
 - Name
 - Category
 - Platform
 - Release Date
 - Price
5. Order
 - Games
 - Order Date
 - Ship Date
6. Review
 - Rating
 - Subject Text
 - Context Text
7. Platform
 - Name
8. Category
 - Name
9. Friendship
 - isFamilyMember
 - isAccepted

## Relationships
A relational database using these entities might look something like this

![Entities](./Entities.png)

This diagram was created with http://ondras.zarovi.cz/sql/demo/

You can load the [XML](./Entities.xml) into that web editor by clicking the "save / load" button
at the top right, pasting the XML into the textarea and clicking "Load XML".

You can load the version stored on their servers by instead clicking the "load" button in the 
server section and paste/type "SeaSharpe" into the dialogue box. This is probably easier and 
faster but it might not be the same version stored in this repository.
