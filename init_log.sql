CREATE TABLE user (
    email VARCHAR(20) NOT NULL,
    karma_points INT NOT NULL DEFAULT 0,
    has_photo INT NOT NULL DEFAULT 0,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    PRIMARY KEY(email)
);
CREATE TABLE card (
    card_no VARCHAR(20) NOT NULL,
    pin INT NOT NULL,
    type VARCHAR(10) NOT NULL,
    expire_month INT NOT NULL,
    expire_year INT NOT NULL,
    PRIMARY KEY(card_no)
);
CREATE TABLE seller (
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY(email),
    FOREIGN KEY(email) REFERENCES user(email) ON DELETE CASCADE
);
CREATE TABLE buyer (
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY(email),
    FOREIGN KEY(email) REFERENCES user(email) ON DELETE CASCADE
);
CREATE TABLE store (
    name VARCHAR(20) NOT NULL,
    seller_email VARCHAR(20) NOT NULL,
    PRIMARY KEY(name),
    FOREIGN KEY(seller_email) REFERENCES seller(email) ON DELETE CASCADE
);
CREATE TABLE 'order' (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    buyer_email VARCHAR(20) NOT NULL,
    delivery_email VARCHAR(20) NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    card_no VARCHAR(20) NOT NULL,
    FOREIGN KEY(buyer_email) REFERENCES buyer(email) ON DELETE CASCADE,
    FOREIGN KEY(card_no) REFERENCES card(card_no)
);
CREATE TABLE order_contents (
    order_id INTEGER NOT NULL,
    serial_no VARCHAR(20) NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    PRIMARY KEY(order_id, serial_no),
    FOREIGN KEY(order_id) REFERENCES 'order'(id) ON DELETE CASCADE,
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE
);
CREATE TABLE item (
    serial_no VARCHAR(20) NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    quantity_sold INT NOT NULL DEFAULT 0,
    title VARCHAR(20) NOT NULL,
    description VARCHAR(200),
    category VARCHAR(20) NOT NULL,
    file_type VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    store_name VARCHAR(20) NOT NULL,
    PRIMARY KEY(serial_no),
    FOREIGN KEY(store_name) REFERENCES store(name) ON DELETE CASCADE
);
CREATE TABLE coupon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    discount INT NOT NULL,
    serial_no VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE,
    FOREIGN KEY(email) REFERENCES buyer(email) ON DELETE CASCADE
);
CREATE TABLE item_review (
    serial_no VARCHAR(20) NOT NULL,
    reviewer_email VARCHAR(20) NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(200),
    PRIMARY KEY(serial_no, reviewer_email)
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE,
    FOREIGN KEY(reviewer_email) REFERENCES buyer(email) ON DELETE CASCADE
);
CREATE TABLE store_review (
    store_name VARCHAR(20) NOT NULL,
    reviewer_email VARCHAR(20) NOT NULL,
    rating INT NOT NULL,
    review VARCHAR(200),
    FOREIGN KEY(reviewer_email) REFERENCES buyer(email) ON DELETE CASCADE,
    FOREIGN KEY (store_name) REFERENCES store(name) ON DELETE CASCADE
);
CREATE TABLE wishlist (
    serial_no VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE,
    FOREIGN KEY(email) REFERENCES buyer(email) ON DELETE CASCADE
);
CREATE TABLE buyer_card (
    email VARCHAR(20) NOT NULL,
    card_no VARCHAR(20) NOT NULL,
    FOREIGN KEY(email) REFERENCES buyer(email) ON DELETE CASCADE,
    FOREIGN KEY(card_no) REFERENCES card(card_no) ON DELETE CASCADE
);
CREATE TABLE item_keyword (
    serial_no VARCHAR(20) NOT NULL,
    keyword VARCHAR(10) NOT NULL,
    PRIMARY KEY(serial_no, keyword),
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE
);
CREATE TABLE item_accepted_card (
    serial_no VARCHAR(20) NOT NULL,
    card_type VARCHAR(10) NOT NULL,
    PRIMARY KEY(serial_no, card_type),
    FOREIGN KEY(serial_no) REFERENCES item(serial_no) ON DELETE CASCADE
);
BEGIN
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('adrianbartlett@hotmail.com', 'Brandi', 'Powers', 1, 1612);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('johnsonkristina@yahoo.com', 'Cindy', 'Gilbert', 1, 1495);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('smithtommy@brown.biz', 'Christopher', 'Riley', 1, 9116);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('melissaadams@gonzalez-mcdowell.biz', 'Shelly', 'Jones', 1, 2355);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('gary19@yahoo.com', 'Charles', 'Lewis', 1, 5672);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('pthomas@gmail.com', 'Joshua', 'Drake', 1, 4451);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('rmoore@hughes.com', 'Lisa', 'Alvarez', 0, 9747);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kimberlybriggs@gmail.com', 'David', 'Lopez', 0, 1957);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('pittmannicholas@hotmail.com', 'Jonathan', 'Lee', 1, 2575);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('sstanton@hotmail.com', 'Marcus', 'Buchanan', 0, 1159);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('klinelinda@gallegos.org', 'Yesenia', 'Torres', 0, 1085);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('xbarker@gmail.com', 'James', 'Tanner', 0, 8200);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kgalvan@fisher.com', 'Michael', 'Hernandez', 0, 8995);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('williamsfrederick@payne.com', 'Elizabeth', 'Brown', 1, 2429);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('myersmark@hotmail.com', 'Emily', 'Mayer', 1, 8806);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('luislane@gmail.com', 'Amanda', 'Duran', 1, 6721);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('alicia64@moran.com', 'Natalie', 'Alexander', 0, 8036);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('charlesfoster@vega-mendoza.com', 'Timothy', 'Campbell', 1, 9838);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('daviesashley@wells.com', 'Lauren', 'Johnson', 0, 1068);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('rwoodard@yahoo.com', 'Karen', 'Roberts', 0, 9552);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kcarter@ramirez.com', 'Matthew', 'Morris', 1, 1391);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('amy34@yahoo.com', 'Monica', 'Foster', 0, 722);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('vicki85@yahoo.com', 'Zachary', 'Jones', 0, 4999);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('bethanybailey@lozano.com', 'Michelle', 'Hall', 0, 8182);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('victoria89@yahoo.com', 'Dustin', 'Rush', 1, 2691);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('uvazquez@hotmail.com', 'David', 'Cooke', 0, 8766);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('dwilliams@yahoo.com', 'Mary', 'Ortiz', 1, 9896);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('cindygonzalez@hotmail.com', 'Adriana', 'Hammond', 0, 8073);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('shaffermaria@yahoo.com', 'Matthew', 'Tucker', 0, 3965);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('slin@yahoo.com', 'Grant', 'Fowler', 1, 3218);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('amy28@hotmail.com', 'Emily', 'Scott', 0, 811);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('michael54@yahoo.com', 'Kimberly', 'Young', 1, 5124);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('amyjohnson@gmail.com', 'Ashley', 'Wood', 1, 5279);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('knelson@frey.com', 'Teresa', 'Dominguez', 1, 3141);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('sacosta@li.com', 'Timothy', 'Castillo', 0, 6111);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('allison69@gmail.com', 'Kristen', 'Freeman', 0, 9137);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kallen@frye-dawson.com', 'Amy', 'Lopez', 0, 7629);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('aliciaryan@miller.com', 'Nicholas', 'Neal', 1, 4334);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('fstewart@frazier.com', 'Tina', 'Noble', 0, 9449);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('comptonalan@yahoo.com', 'Sandra', 'Browning', 0, 5187);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('eric39@yahoo.com', 'Sean', 'Shaw', 1, 8570);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('jmyers@wright-mitchell.org', 'Rebecca', 'Moore', 1, 9442);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('cgomez@yahoo.com', 'Sean', 'Pierce', 0, 1133);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('chad36@hotmail.com', 'Todd', 'Chan', 1, 4959);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('lisaholmes@hotmail.com', 'Faith', 'Turner', 0, 427);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('douglas66@gmail.com', 'Derrick', 'Turner', 0, 8857);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('joseph67@gmail.com', 'Leslie', 'Jones', 0, 3772);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('iadams@proctor-hill.org', 'Tonya', 'Harris', 0, 2394);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('erikagutierrez@gmail.com', 'Stephanie', 'Khan', 0, 3664);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('wileylisa@gmail.com', 'Kathryn', 'Perry', 0, 6909);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('maguilar@johnston-cortez.com', 'Taylor', 'Smith', 1, 9286);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('narmstrong@clark-reynolds.com', 'Robert', 'Gates', 0, 1185);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kristin31@yahoo.com', 'Antonio', 'Adams', 0, 471);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('hillapril@jenkins.com', 'Ian', 'Christian', 0, 9438);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('seanthompson@schneider.net', 'Renee', 'Flowers', 1, 9744);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('johnsonkyle@porter.biz', 'Christine', 'Booth', 1, 9453);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('matthew89@gmail.com', 'Laurie', 'Bautista', 0, 2993);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('zachary98@lee.com', 'William', 'Walsh', 1, 5412);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('solson@hotmail.com', 'Bryce', 'Morrison', 0, 172);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('javier78@berry.net', 'Karen', 'Wilkins', 1, 9472);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('armstrongmatthew@yahoo.com', 'Joanne', 'Miller', 0, 3994);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('esmith@hotmail.com', 'Angela', 'Reed', 0, 7064);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('bryantjeffery@yahoo.com', 'Matthew', 'Price', 0, 1557);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('howardjulie@adams.biz', 'Ann', 'Snyder', 1, 8243);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('rcraig@yahoo.com', 'Leslie', 'Weaver', 0, 9412);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('colleenhaynes@gray-wade.info', 'Paul', 'Hudson', 1, 2341);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('tdominguez@jensen.biz', 'Beverly', 'Singh', 1, 4282);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('hsolomon@cobb.com', 'Thomas', 'Gregory', 1, 4624);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('vodonnell@griffin.biz', 'Matthew', 'Lee', 1, 1553);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('ronaldprice@leonard.biz', 'Shawn', 'Howard', 0, 2999);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('brenda23@schaefer-jenkins.biz', 'Jonathan', 'Nguyen', 0, 5140);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('reesegabriel@hotmail.com', 'John', 'Sullivan', 1, 4533);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('bryanttracy@bruce-brown.com', 'Jason', 'Anderson', 0, 9490);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('mathiskeith@white.com', 'John', 'Lane', 0, 6405);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('skaufman@thomas.com', 'Michelle', 'Rich', 1, 1331);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('edwardsjonathan@hotmail.com', 'Rodney', 'Pollard', 1, 5892);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('williamsheather@morales-brooks.biz', 'Troy', 'Torres', 0, 2724);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('benjamin58@ward.com', 'Katherine', 'Phillips', 0, 8510);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('derek64@yahoo.com', 'Brad', 'Smith', 1, 3636);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('angela19@gmail.com', 'Nathan', 'Love', 0, 669);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('carsonchristine@hotmail.com', 'Michelle', 'Drake', 1, 6305);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('sonya44@reid-jones.biz', 'Mason', 'Heath', 0, 7785);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('cbryant@gmail.com', 'Michelle', 'Clark', 1, 4464);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('hschmidt@nelson-gross.org', 'Brenda', 'Brown', 0, 6672);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('zwest@williams.com', 'Catherine', 'Blankenship', 0, 424);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('daviscristian@russo-davis.net', 'Michelle', 'Harris', 0, 6505);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('rgonzalez@yahoo.com', 'Sandra', 'Brown', 0, 8913);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('sean78@hodge.biz', 'Haley', 'Murillo', 1, 7988);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('tracy75@thomas.com', 'Melissa', 'Kerr', 0, 8241);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('christopherlane@hotmail.com', 'Timothy', 'Morris', 0, 1657);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('johnsonchristopher@yahoo.com', 'Raymond', 'Diaz', 1, 1562);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('james82@hotmail.com', 'Debra', 'Bailey', 1, 8420);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('alisonmichael@yahoo.com', 'James', 'Pearson', 1, 2944);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('linda24@jones-compton.com', 'James', 'Bryant', 0, 9655);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('peter44@yu.com', 'Kyle', 'Golden', 1, 8150);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('alyssa53@mcgrath.com', 'Maria', 'Miller', 0, 3325);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('paul36@goodwin.com', 'Sarah', 'Holt', 1, 4942);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('browncindy@cross-welch.com', 'Dustin', 'Macias', 0, 2194);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('snydershaun@yahoo.com', 'Jeremy', 'Rodriguez', 0, 5911);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('nancyclark@yahoo.com', 'Peter', 'Cox', 0, 6512);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('moyermelanie@aguilar.com', 'Amy', 'Nelson', 1, 6445);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('edwardsjennifer@yahoo.com', 'Susan', 'Davis', 1, 1114);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('jonathandavis@rodriguez-webster.com', 'Anthony', 'Torres', 0, 7313);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('fcoleman@gmail.com', 'Joanne', 'Graves', 1, 8569);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('mahoneyolivia@hotmail.com', 'Kendra', 'Mendez', 1, 2091);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('hatfieldjimmy@douglas.net', 'Kristen', 'Miller', 1, 6423);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('ginarusso@drake-miller.com', 'John', 'Barr', 0, 2494);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kowens@rogers-elliott.com', 'Brendan', 'Proctor', 1, 9534);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('michael71@barajas.com', 'Catherine', 'Duran', 1, 1927);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('xmyers@hotmail.com', 'Joshua', 'Meza', 1, 6733);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('vancenathan@rojas.com', 'Karl', 'Bowman', 0, 5866);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('wmcconnell@brown.org', 'Blake', 'Mathis', 0, 4505);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('uperez@hotmail.com', 'Kristine', 'Porter', 0, 5246);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('cooperroy@weaver.info', 'Mike', 'Sanders', 0, 5227);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('nconner@parker.com', 'Karen', 'Campbell', 1, 8286);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('bartonshelley@hotmail.com', 'Eugene', 'Lyons', 1, 443);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('ecooper@yahoo.com', 'Daniel', 'Herman', 0, 8942);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('pcoleman@gmail.com', 'Robert', 'Holden', 0, 6784);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('rebeccaolsen@hotmail.com', 'Mary', 'Mercado', 0, 3030);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('asullivan@pierce.com', 'Nicole', 'Blevins', 1, 8191);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('samantha06@osborne-williams.org', 'Matthew', 'Brown', 0, 5785);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('vincenttaylor@gonzalez-austin.com', 'Stephen', 'Short', 1, 559);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('znorris@hopkins.com', 'Brenda', 'Allen', 1, 493);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('andersonmatthew@yahoo.com', 'Elizabeth', 'Reed', 1, 3957);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('yholmes@gmail.com', 'Ashley', 'Murphy', 1, 9376);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('johnsonmichael@gmail.com', 'Andrew', 'Abbott', 0, 5395);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('snyderhailey@gmail.com', 'Amber', 'Jimenez', 0, 4574);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('josephsmith@robertson-gonzales.org', 'Tiffany', 'Peters', 0, 3854);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('lindsayspencer@wyatt.biz', 'Joanna', 'Rodriguez', 1, 8884);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kimberlyreed@baldwin-scott.com', 'Kimberly', 'Buchanan', 0, 1017);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('william12@fisher.com', 'Elizabeth', 'Jones', 0, 9834);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('michael28@gmail.com', 'Justin', 'Farrell', 1, 3778);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('romerocaleb@crawford.com', 'John', 'Gutierrez', 0, 2467);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('joseph82@williams-marsh.net', 'Amanda', 'Davis', 1, 9046);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('james62@yahoo.com', 'Daniel', 'Oliver', 1, 8146);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('lanejoan@taylor.info', 'Johnny', 'Contreras', 0, 3203);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('williamssarah@hughes-hill.org', 'Kimberly', 'Phillips', 1, 4766);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('huntkimberly@cooper.com', 'Michelle', 'Foster', 0, 882);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kimberlythomas@gmail.com', 'Benjamin', 'Bowman', 0, 583);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('tracyscott@hardin-rodriguez.com', 'Lisa', 'Woodard', 0, 7348);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('jenniferroy@osborne.com', 'Michelle', 'Hill', 0, 9716);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('prodriguez@yahoo.com', 'John', 'Nichols', 0, 6779);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('brandondominguez@hotmail.com', 'Daniel', 'Cook', 0, 4301);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('sherioconnor@gmail.com', 'Kevin', 'Tanner', 0, 1100);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('acuevas@gmail.com', 'Nathan', 'Williams', 0, 8607);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('williamskatherine@yahoo.com', 'Jason', 'Ayers', 1, 2434);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('ambermartinez@marsh.com', 'Stephen', 'Lyons', 1, 2109);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('gallagherangel@pena-russell.com', 'Jessica', 'Jackson', 0, 5354);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('turnermichael@yahoo.com', 'Kerry', 'Mullen', 1, 2492);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('lauren96@mosley.org', 'Jason', 'Fox', 1, 3892);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('wesleymitchell@hammond.biz', 'Tracy', 'Smith', 0, 4050);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('slawson@fisher.com', 'Crystal', 'Powers', 0, 4792);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('dbrown@arroyo.com', 'Stephen', 'Buck', 0, 6593);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('philip98@bishop.com', 'Andrew', 'Alexander', 0, 2663);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('danacross@lee.net', 'Lisa', 'Schwartz', 0, 6212);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('romeroalexander@hotmail.com', 'Brenda', 'Hall', 1, 1342);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('vgarcia@hodge.com', 'Brittney', 'Park', 1, 2207);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('tapiadavid@hall.com', 'Andrew', 'Allen', 1, 67);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('xhawkins@rowe.com', 'Stephanie', 'Combs', 1, 9326);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('waltersmichelle@yahoo.com', 'Justin', 'Bowman', 1, 8167);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('xrivas@yahoo.com', 'Regina', 'Mckenzie', 1, 5389);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('othomas@vazquez.info', 'Patrick', 'Huber', 0, 6577);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('jenna75@gmail.com', 'Courtney', 'Sullivan', 1, 172);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('christiangutierrez@may.com', 'Gabriel', 'Fisher', 1, 823);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('brandon64@hotmail.com', 'Timothy', 'Sanchez', 1, 2340);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('jeremy89@hotmail.com', 'Dana', 'Stanley', 1, 5137);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('grace48@garrett-garza.org', 'Dawn', 'Williams', 1, 2018);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('coxangela@jones.com', 'Haley', 'Weiss', 1, 7593);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('twillis@hotmail.com', 'Kristen', 'Johnson', 1, 6670);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('rileyrebecca@hotmail.com', 'Andrea', 'Lawrence', 0, 2223);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('daniel43@nelson.biz', 'Andrew', 'Johnson', 1, 5060);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('masseychristian@johnson.com', 'Kristin', 'Costa', 0, 7250);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('clarkjonathan@yahoo.com', 'Jessica', 'Blake', 1, 9406);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('parkstacy@gmail.com', 'Erika', 'Delacruz', 1, 151);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('walkeryvonne@gmail.com', 'Paul', 'Contreras', 1, 688);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('gary51@yahoo.com', 'Cassandra', 'Gonzalez', 1, 3482);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('vhopkins@gmail.com', 'Michelle', 'Williams', 1, 9715);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('samanthabrown@cox-wilson.com', 'Wesley', 'Villarreal', 1, 6979);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('maryortiz@wright-wilson.biz', 'Mark', 'Mitchell', 1, 6459);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('riverajoshua@hotmail.com', 'Cindy', 'Lester', 1, 1548);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('johnschultz@hotmail.com', 'Jasmine', 'Griffin', 0, 782);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('alvaradomeghan@yahoo.com', 'Krista', 'Ross', 0, 9444);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('zwhite@boyd.com', 'Debra', 'Little', 0, 4526);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('alicia26@jones-farmer.net', 'Amanda', 'Stewart', 1, 2768);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('stevenwright@barnes-vargas.com', 'Jonathan', 'Stewart', 0, 999);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('stefanie52@lucas.com', 'Natalie', 'Williamson', 1, 3642);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('oliviawallace@duncan-west.biz', 'Nancy', 'Rodriguez', 0, 2466);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('tchen@hernandez.com', 'Russell', 'Rodriguez', 0, 9470);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('johnsonrobert@hotmail.com', 'Michael', 'Thompson', 1, 4199);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('hlee@yahoo.com', 'Patrick', 'Anderson', 1, 8943);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('eperez@hotmail.com', 'Stephen', 'Burke', 1, 9208);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('michael98@yahoo.com', 'Michael', 'Guzman', 1, 9740);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('paulaskinner@gmail.com', 'Deborah', 'Lopez', 1, 7550);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('michaelshort@woodward-houston.com', 'Kevin', 'Ryan', 0, 3370);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('jennifer30@hotmail.com', 'Phyllis', 'Coleman', 0, 9149);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('psmith@olson-jones.com', 'Amanda', 'Lambert', 0, 7394);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('anthonyflowers@gmail.com', 'Brianna', 'Lyons', 1, 1296);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('rachel68@yahoo.com', 'Lisa', 'Morales', 0, 9497);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('julie67@hotmail.com', 'Ethan', 'Miller', 0, 1608);
INSERT INTO user (email, first_name, last_name, has_photo, karma_points)
    VALUES ('kmitchell@dorsey.com', 'Shelley', 'Watson', 0, 1294);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180014299836414', '888', 'VISA 19 digit', 4, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30403019229194', '6851', 'JCB 16 digit', 4, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4547648628689', '987', 'JCB 16 digit', 4, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4638385005974994854', '3123', 'VISA 16 digit', 9, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('5169464184310336', '126', 'VISA 16 digit', 5, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4956790602594005817', '280', 'Maestro', 7, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4171422261185', '410', 'JCB 16 digit', 11, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('349104296546385', '109', 'JCB 16 digit', 11, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4384123874398108', '598', 'VISA 19 digit', 1, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('676259142476', '575', 'JCB 15 digit', 7, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('379041837937215', '404', 'VISA 16 digit', 3, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213108792674370', '970', 'VISA 19 digit', 1, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6502165589609735', '969', 'Maestro', 10, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4543460637027830352', '7843', 'American Express', 11, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4395956622591780', '1441', 'American Express', 10, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('568861960082', '615', 'JCB 15 digit', 10, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4807256648318553691', '647', 'American Express', 7, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('675969137115', '699', 'Diners Club / Carte Blanche', 11, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30444910102882', '839', 'JCB 16 digit', 7, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2286758892220934', '885', 'Maestro', 9, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6011347557518684', '827', 'VISA 16 digit', 10, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3517271146242935', '228', 'Diners Club / Carte Blanche', 10, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('349801544271787', '318', 'Diners Club / Carte Blanche', 1, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6011109281841984', '668', 'JCB 16 digit', 3, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4496676044627', '6995', 'VISA 16 digit', 11, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2289321326002977', '913', 'Diners Club / Carte Blanche', 2, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4053985807164729941', '0655', 'VISA 13 digit', 11, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4417563425652010091', '864', 'JCB 16 digit', 8, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3538272944089036', '825', 'VISA 19 digit', 5, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('370855314278994', '727', 'Mastercard', 7, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180047844706096', '386', 'JCB 16 digit', 11, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4707232440558', '332', 'VISA 16 digit', 11, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3556198548111941', '051', 'Diners Club / Carte Blanche', 3, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2261065572607110', '794', 'Mastercard', 4, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2250898986633758', '872', 'American Express', 7, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2272908237254967', '598', 'VISA 13 digit', 10, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4579791584206109774', '847', 'JCB 15 digit', 3, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3547830512011424', '102', 'Maestro', 1, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4282951340419584', '607', 'JCB 16 digit', 3, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3535780234280936', '477', 'JCB 16 digit', 9, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3555141773317453', '250', 'Mastercard', 4, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180070049971588', '073', 'JCB 15 digit', 5, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('373150292419647', '613', 'JCB 16 digit', 2, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180025960308061', '176', 'JCB 16 digit', 10, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30477835624028', '513', 'JCB 15 digit', 6, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4645029277102275', '6293', 'Mastercard', 1, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6011867412612224', '443', 'VISA 16 digit', 9, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4521191352799', '209', 'JCB 16 digit', 11, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213102169918502', '076', 'JCB 15 digit', 12, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3508050248575942', '791', 'Discover', 12, 2020);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2288222525536263', '090', 'Mastercard', 12, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('676319122997', '503', 'JCB 16 digit', 1, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('060472340490', '063', 'VISA 16 digit', 7, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30444659052918', '706', 'JCB 15 digit', 2, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4853180767713752255', '546', 'American Express', 4, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('568601249929', '518', 'VISA 16 digit', 6, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3543877956473069', '434', 'Discover', 8, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213118640311240', '593', 'Mastercard', 11, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180039854743523', '383', 'Mastercard', 2, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('341271278155796', '178', 'VISA 16 digit', 11, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4828987124368929', '594', 'VISA 13 digit', 3, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('5255198101373002', '214', 'Maestro', 3, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30158139414312', '736', 'Maestro', 7, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4728977214291504', '390', 'American Express', 5, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2660260676905372', '862', 'VISA 19 digit', 7, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3531510502749963', '964', 'Maestro', 8, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4188495453329010740', '867', 'JCB 15 digit', 12, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4716394708212070766', '204', 'VISA 16 digit', 7, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('344990918099737', '425', 'JCB 16 digit', 11, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180035930608482', '2131', 'VISA 19 digit', 10, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3584492530540522', '690', 'JCB 16 digit', 6, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4348138056448831', '370', 'JCB 16 digit', 12, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4073958713174947', '3315', 'JCB 16 digit', 7, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6561410715510631', '363', 'JCB 15 digit', 3, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4785003907708', '029', 'American Express', 6, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2242322168303099', '079', 'American Express', 1, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4489409811604470938', '899', 'VISA 13 digit', 4, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30249498563433', '759', 'Diners Club / Carte Blanche', 3, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4009410794244768', '696', 'VISA 19 digit', 6, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('676285091945', '712', 'Discover', 10, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2706835545914451', '783', 'VISA 13 digit', 8, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30127113918838', '084', 'JCB 15 digit', 7, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2711786866282262', '171', 'Maestro', 10, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3536521386454229', '719', 'Discover', 5, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('372472112232633', '1757', 'Discover', 8, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4484412345479292107', '999', 'Maestro', 7, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180036671081426', '951', 'JCB 16 digit', 7, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('676318555239', '587', 'Mastercard', 9, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213170401248293', '694', 'VISA 13 digit', 10, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('375116346037618', '434', 'VISA 16 digit', 11, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30331781103554', '690', 'VISA 16 digit', 12, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2267312552819115', '547', 'Maestro', 5, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4061976366639169328', '627', 'JCB 16 digit', 11, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180041092484670', '818', 'Mastercard', 10, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6538141179789540', '036', 'JCB 15 digit', 11, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3517250113173687', '850', 'JCB 16 digit', 4, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4789739290633066', '884', 'Discover', 6, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3534297077872902', '272', 'JCB 15 digit', 1, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4618274224435286', '247', 'Discover', 11, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6011916484943650', '116', 'VISA 19 digit', 12, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3506005121054011', '653', 'VISA 16 digit', 8, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180077593488810', '564', 'JCB 16 digit', 1, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3507102433596919', '819', 'Discover', 1, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30228756769239', '998', 'VISA 16 digit', 8, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3570556867375144', '479', 'American Express', 2, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2283190391502799', '341', 'VISA 19 digit', 5, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('38929670299896', '736', 'VISA 16 digit', 8, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('340919090620428', '222', 'Discover', 2, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2231263026766056', '555', 'JCB 15 digit', 7, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('349237033966290', '673', 'VISA 13 digit', 2, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4289878025367858', '385', 'JCB 15 digit', 2, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180041031587401', '281', 'JCB 16 digit', 4, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6505537136570262', '998', 'Maestro', 1, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2307695901440035', '430', 'VISA 16 digit', 5, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('560286852416', '185', 'VISA 13 digit', 12, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4662162984424027', '541', 'JCB 15 digit', 8, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3559639914068550', '607', 'American Express', 8, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4126476480376030', '083', 'VISA 19 digit', 1, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4845465059826', '009', 'Diners Club / Carte Blanche', 4, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2720555385401292', '790', 'American Express', 11, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('349708752741916', '177', 'JCB 16 digit', 3, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('501821102610', '574', 'JCB 16 digit', 8, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4312787731590', '729', 'VISA 16 digit', 12, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30037805075492', '314', 'Diners Club / Carte Blanche', 6, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2245474419616600', '995', 'Discover', 8, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4014302481100283', '088', 'VISA 19 digit', 12, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4067367043008876353', '735', 'Maestro', 12, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('345369153656684', '0796', 'Discover', 8, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30169335131592', '360', 'VISA 16 digit', 1, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4900645776029782', '100', 'VISA 19 digit', 5, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3590476474430073', '4357', 'JCB 16 digit', 11, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4633218150956922525', '274', 'VISA 13 digit', 11, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('676119328257', '703', 'JCB 16 digit', 8, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4494592352654345818', '589', 'Mastercard', 5, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4941704426368248', '678', 'American Express', 2, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3509511683158048', '709', 'JCB 15 digit', 6, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('574562412951', '617', 'Discover', 10, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('676282771804', '497', 'American Express', 11, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('340623031774241', '889', 'American Express', 4, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4114372882491267', '682', 'JCB 16 digit', 11, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4719434799957845', '651', 'VISA 19 digit', 9, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('340295508943391', '227', 'VISA 16 digit', 3, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('344615101254258', '956', 'Mastercard', 6, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4503729883325175', '686', 'JCB 16 digit', 8, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4728069549254280', '932', 'Maestro', 10, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3517978903108667', '841', 'JCB 15 digit', 1, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30415719985628', '403', 'Diners Club / Carte Blanche', 1, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4154437792383440', '341', 'VISA 16 digit', 10, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180039182283010', '443', 'JCB 15 digit', 9, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('639069191604', '469', 'Diners Club / Carte Blanche', 2, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4738102434797697', '815', 'JCB 16 digit', 12, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30449649017376', '305', 'JCB 16 digit', 5, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3544970791781363', '540', 'VISA 16 digit', 6, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4498444063054523', '815', 'JCB 16 digit', 2, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3537943540614630', '049', 'Mastercard', 5, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3510434087866602', '668', 'VISA 16 digit', 7, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4711850318062', '635', 'Diners Club / Carte Blanche', 8, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4312023002419205', '824', 'American Express', 5, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('676150752050', '501', 'Mastercard', 4, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('5274760201829980', '015', 'VISA 16 digit', 9, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3596902618739768', '731', 'VISA 13 digit', 11, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('676339760685', '695', 'JCB 16 digit', 8, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3517312324074672', '807', 'JCB 16 digit', 3, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3594110926310056', '081', 'VISA 16 digit', 9, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4127592125733', '862', 'JCB 16 digit', 12, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('344629777980559', '162', 'Discover', 9, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('574057563219', '338', 'American Express', 6, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4648483973460674860', '166', 'JCB 15 digit', 5, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4848653357808272', '365', 'VISA 16 digit', 12, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180016592288672', '791', 'VISA 16 digit', 12, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213154797361480', '518', 'Maestro', 7, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6597569009941824', '786', 'VISA 19 digit', 6, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('38645407880200', '812', 'Diners Club / Carte Blanche', 3, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4305986920310863', '242', 'JCB 16 digit', 7, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('36763202192952', '196', 'Discover', 11, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30426809309793', '091', 'VISA 16 digit', 4, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4559003986299684', '169', 'Diners Club / Carte Blanche', 6, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180074366765672', '226', 'Mastercard', 4, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4771697049817', '229', 'Mastercard', 4, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('377410820745384', '961', 'Maestro', 7, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30494245080568', '884', 'JCB 15 digit', 12, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2560402818011914', '545', 'JCB 16 digit', 11, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4899402739150799', '069', 'VISA 13 digit', 9, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213165112153931', '136', 'VISA 19 digit', 4, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4650712176543371020', '242', 'VISA 16 digit', 12, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3579980771236963', '380', 'American Express', 7, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4913439808668402', '561', 'JCB 16 digit', 2, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3571385164766535', '649', 'VISA 16 digit', 2, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213198617085563', '7855', 'JCB 15 digit', 10, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('371621705048266', '7403', 'Maestro', 11, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3516228607753454', '866', 'Maestro', 4, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4852955654988969', '394', 'VISA 19 digit', 10, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6011662698598357', '091', 'JCB 16 digit', 3, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4894778804438372093', '871', 'Discover', 9, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4634362536445', '2313', 'JCB 16 digit', 9, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6011816587940845', '988', 'VISA 13 digit', 5, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6544020534892623', '105', 'American Express', 8, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3521333047668776', '660', 'JCB 16 digit', 2, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4503000646153969', '423', 'Maestro', 11, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('5575077821698182', '242', 'JCB 15 digit', 5, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3580991106998810', '130', 'VISA 13 digit', 10, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3564781453398767', '729', 'JCB 16 digit', 8, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('348853444087756', '033', 'Discover', 10, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('344333777165176', '390', 'JCB 16 digit', 5, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3581513357645665', '529', 'VISA 13 digit', 5, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6590443986637937', '968', 'Diners Club / Carte Blanche', 10, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3501659955292181', '056', 'Mastercard', 7, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('630488682711', '952', 'JCB 15 digit', 9, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('502000194600', '837', 'Discover', 10, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('2282530364950510', '199', 'Mastercard', 10, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3534551175324921', '771', 'VISA 16 digit', 12, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4689580759786495', '921', 'American Express', 9, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('30325708682450', '210', 'Maestro', 1, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('5188417536919375', '497', 'VISA 16 digit', 3, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4444065290793008', '827', 'VISA 13 digit', 10, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4784907845043152799', '575', 'VISA 19 digit', 5, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4192359929503', '129', 'JCB 15 digit', 10, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6576064931213489', '9432', 'Mastercard', 7, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3598669543347060', '994', 'Diners Club / Carte Blanche', 5, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3549809732251547', '307', 'JCB 16 digit', 2, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('342172541604983', '122', 'Discover', 11, 2023);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('343110641372308', '5471', 'VISA 16 digit', 3, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180040922633472', '365', 'JCB 16 digit', 1, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4080949201592', '438', 'VISA 16 digit', 3, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3536160321955337', '446', 'VISA 13 digit', 5, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4857072282858229', '976', 'JCB 16 digit', 4, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4825247690181831', '226', 'JCB 16 digit', 5, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3575261153595555', '2981', 'VISA 16 digit', 8, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4354698990727166098', '039', 'JCB 15 digit', 4, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('36827231491865', '638', 'Maestro', 4, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213138361011134', '931', 'VISA 16 digit', 12, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3564236160112654', '843', 'VISA 19 digit', 12, 2027);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3503220708307277', '444', 'VISA 13 digit', 6, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4382593402300761144', '705', 'VISA 19 digit', 5, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('341339185922705', '881', 'Maestro', 5, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3560576805127318', '789', 'JCB 15 digit', 8, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4689283230746622', '611', 'Mastercard', 1, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3596945888719119', '296', 'Discover', 1, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4207090649127813477', '899', 'American Express', 11, 2024);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('6590040412652579', '870', 'Discover', 3, 2028);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4587346901078568', '565', 'American Express', 3, 2029);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213173088325731', '624', 'VISA 19 digit', 4, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('502090333506', '594', 'JCB 15 digit', 11, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('180071363072300', '611', 'VISA 13 digit', 3, 2021);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('213140033136695', '390', 'Maestro', 2, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3518934409400206', '048', 'VISA 16 digit', 7, 2022);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('3564604805834877', '125', 'Discover', 1, 2026);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4426611990249098', '805', 'Maestro', 5, 2025);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4872139078829564', '522', 'Mastercard', 4, 2030);
INSERT INTO card (
        card_no,
        pin,
        type,
        expire_month,
        expire_year
    ) VALUES ('4338695844647', '052', 'JCB 15 digit', 1, 2029);
INSERT INTO buyer_card (email, card_no)
    VALUES ('paul36@goodwin.com', '373150292419647');
INSERT INTO buyer_card (email, card_no)
    VALUES ('waltersmichelle@yahoo.com', '373150292419647');
INSERT INTO buyer_card (email, card_no)
    VALUES ('rileyrebecca@hotmail.com', '3501659955292181');
INSERT INTO buyer_card (email, card_no)
    VALUES ('vicki85@yahoo.com', '348853444087756');
INSERT INTO buyer_card (email, card_no)
    VALUES ('reesegabriel@hotmail.com', '676282771804');
INSERT INTO buyer_card (email, card_no)
    VALUES ('uperez@hotmail.com', '341271278155796');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kristin31@yahoo.com', '180025960308061');
INSERT INTO buyer_card (email, card_no)
    VALUES ('romerocaleb@crawford.com', '3596945888719119');
INSERT INTO buyer_card (email, card_no)
    VALUES ('xmyers@hotmail.com', '180071363072300');
INSERT INTO buyer_card (email, card_no)
    VALUES ('zwhite@boyd.com', '3536521386454229');
INSERT INTO buyer_card (email, card_no)
    VALUES ('gary51@yahoo.com', '639069191604');
INSERT INTO buyer_card (email, card_no)
    VALUES ('stefanie52@lucas.com', '2720555385401292');
INSERT INTO buyer_card (email, card_no)
    VALUES ('jonathandavis@rodriguez-webster.com', '3596902618739768');
INSERT INTO buyer_card (email, card_no)
    VALUES ('andersonmatthew@yahoo.com', '6576064931213489');
INSERT INTO buyer_card (email, card_no)
    VALUES ('edwardsjennifer@yahoo.com', '4853180767713752255');
INSERT INTO buyer_card (email, card_no)
    VALUES ('james62@yahoo.com', '370855314278994');
INSERT INTO buyer_card (email, card_no)
    VALUES ('ecooper@yahoo.com', '379041837937215');
INSERT INTO buyer_card (email, card_no)
    VALUES ('ginarusso@drake-miller.com', '3584492530540522');
INSERT INTO buyer_card (email, card_no)
    VALUES ('williamsheather@morales-brooks.biz', '213140033136695');
INSERT INTO buyer_card (email, card_no)
    VALUES ('othomas@vazquez.info', '3560576805127318');
INSERT INTO buyer_card (email, card_no)
    VALUES ('masseychristian@johnson.com', '38645407880200');
INSERT INTO buyer_card (email, card_no)
    VALUES ('williamsfrederick@payne.com', '375116346037618');
INSERT INTO buyer_card (email, card_no)
    VALUES ('paulaskinner@gmail.com', '4785003907708');
INSERT INTO buyer_card (email, card_no)
    VALUES ('philip98@bishop.com', '38645407880200');
INSERT INTO buyer_card (email, card_no)
    VALUES ('williamskatherine@yahoo.com', '4126476480376030');
INSERT INTO buyer_card (email, card_no)
    VALUES ('lanejoan@taylor.info', '4579791584206109774');
INSERT INTO buyer_card (email, card_no)
    VALUES ('jeremy89@hotmail.com', '5274760201829980');
INSERT INTO buyer_card (email, card_no)
    VALUES ('derek64@yahoo.com', '213173088325731');
INSERT INTO buyer_card (email, card_no)
    VALUES ('reesegabriel@hotmail.com', '2283190391502799');
INSERT INTO buyer_card (email, card_no)
    VALUES ('armstrongmatthew@yahoo.com', '2282530364950510');
INSERT INTO buyer_card (email, card_no)
    VALUES ('aliciaryan@miller.com', '341339185922705');
INSERT INTO buyer_card (email, card_no)
    VALUES ('lauren96@mosley.org', '060472340490');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kgalvan@fisher.com', '36827231491865');
INSERT INTO buyer_card (email, card_no)
    VALUES ('sonya44@reid-jones.biz', '30426809309793');
INSERT INTO buyer_card (email, card_no)
    VALUES ('brenda23@schaefer-jenkins.biz', '4707232440558');
INSERT INTO buyer_card (email, card_no)
    VALUES ('william12@fisher.com', '30444910102882');
INSERT INTO buyer_card (email, card_no)
    VALUES ('howardjulie@adams.biz', '4648483973460674860');
INSERT INTO buyer_card (email, card_no)
    VALUES ('vicki85@yahoo.com', '4634362536445');
INSERT INTO buyer_card (email, card_no)
    VALUES ('comptonalan@yahoo.com', '5575077821698182');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kimberlyreed@baldwin-scott.com', '30325708682450');
INSERT INTO buyer_card (email, card_no)
    VALUES ('znorris@hopkins.com', '3555141773317453');
INSERT INTO buyer_card (email, card_no)
    VALUES ('tracy75@thomas.com', '4417563425652010091');
INSERT INTO buyer_card (email, card_no)
    VALUES ('riverajoshua@hotmail.com', '4789739290633066');
INSERT INTO buyer_card (email, card_no)
    VALUES ('pcoleman@gmail.com', '30169335131592');
INSERT INTO buyer_card (email, card_no)
    VALUES ('johnsonrobert@hotmail.com', '3536521386454229');
INSERT INTO buyer_card (email, card_no)
    VALUES ('twillis@hotmail.com', '3531510502749963');
INSERT INTO buyer_card (email, card_no)
    VALUES ('brandondominguez@hotmail.com', '568601249929');
INSERT INTO buyer_card (email, card_no)
    VALUES ('allison69@gmail.com', '3575261153595555');
INSERT INTO buyer_card (email, card_no)
    VALUES ('william12@fisher.com', '4484412345479292107');
INSERT INTO buyer_card (email, card_no)
    VALUES ('edwardsjennifer@yahoo.com', '3508050248575942');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kristin31@yahoo.com', '4633218150956922525');
INSERT INTO buyer_card (email, card_no)
    VALUES ('yholmes@gmail.com', '4857072282858229');
INSERT INTO buyer_card (email, card_no)
    VALUES ('asullivan@pierce.com', '501821102610');
INSERT INTO buyer_card (email, card_no)
    VALUES ('snyderhailey@gmail.com', '676318555239');
INSERT INTO buyer_card (email, card_no)
    VALUES ('jonathandavis@rodriguez-webster.com', '3549809732251547');
INSERT INTO buyer_card (email, card_no)
    VALUES ('bryanttracy@bruce-brown.com', '30449649017376');
INSERT INTO buyer_card (email, card_no)
    VALUES ('xbarker@gmail.com', '3580991106998810');
INSERT INTO buyer_card (email, card_no)
    VALUES ('mathiskeith@white.com', '6590443986637937');
INSERT INTO buyer_card (email, card_no)
    VALUES ('masseychristian@johnson.com', '501821102610');
INSERT INTO buyer_card (email, card_no)
    VALUES ('psmith@olson-jones.com', '4188495453329010740');
INSERT INTO buyer_card (email, card_no)
    VALUES ('philip98@bishop.com', '213170401248293');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kristin31@yahoo.com', '180036671081426');
INSERT INTO buyer_card (email, card_no)
    VALUES ('brenda23@schaefer-jenkins.biz', '4853180767713752255');
INSERT INTO buyer_card (email, card_no)
    VALUES ('yholmes@gmail.com', '4789739290633066');
INSERT INTO buyer_card (email, card_no)
    VALUES ('xmyers@hotmail.com', '4784907845043152799');
INSERT INTO buyer_card (email, card_no)
    VALUES ('tracy75@thomas.com', '3521333047668776');
INSERT INTO buyer_card (email, card_no)
    VALUES ('andersonmatthew@yahoo.com', '4312023002419205');
INSERT INTO buyer_card (email, card_no)
    VALUES ('rebeccaolsen@hotmail.com', '4282951340419584');
INSERT INTO buyer_card (email, card_no)
    VALUES ('vicki85@yahoo.com', '4633218150956922525');
INSERT INTO buyer_card (email, card_no)
    VALUES ('wesleymitchell@hammond.biz', '345369153656684');
INSERT INTO buyer_card (email, card_no)
    VALUES ('johnsonkyle@porter.biz', '379041837937215');
INSERT INTO buyer_card (email, card_no)
    VALUES ('walkeryvonne@gmail.com', '4689580759786495');
INSERT INTO buyer_card (email, card_no)
    VALUES ('ronaldprice@leonard.biz', '3535780234280936');
INSERT INTO buyer_card (email, card_no)
    VALUES ('luislane@gmail.com', '3594110926310056');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kallen@frye-dawson.com', '2560402818011914');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kimberlybriggs@gmail.com', '3564781453398767');
INSERT INTO buyer_card (email, card_no)
    VALUES ('stevenwright@barnes-vargas.com', '2711786866282262');
INSERT INTO buyer_card (email, card_no)
    VALUES ('rebeccaolsen@hotmail.com', '379041837937215');
INSERT INTO buyer_card (email, card_no)
    VALUES ('shaffermaria@yahoo.com', '213140033136695');
INSERT INTO buyer_card (email, card_no)
    VALUES ('johnsonchristopher@yahoo.com', '344990918099737');
INSERT INTO buyer_card (email, card_no)
    VALUES ('tchen@hernandez.com', '5575077821698182');
INSERT INTO buyer_card (email, card_no)
    VALUES ('bethanybailey@lozano.com', '6011867412612224');
INSERT INTO buyer_card (email, card_no)
    VALUES ('daviesashley@wells.com', '574562412951');
INSERT INTO buyer_card (email, card_no)
    VALUES ('masseychristian@johnson.com', '180074366765672');
INSERT INTO buyer_card (email, card_no)
    VALUES ('williamssarah@hughes-hill.org', '6011109281841984');
INSERT INTO buyer_card (email, card_no)
    VALUES ('daviesashley@wells.com', '4312787731590');
INSERT INTO buyer_card (email, card_no)
    VALUES ('hillapril@jenkins.com', '4872139078829564');
INSERT INTO buyer_card (email, card_no)
    VALUES ('michael98@yahoo.com', '4348138056448831');
INSERT INTO buyer_card (email, card_no)
    VALUES ('comptonalan@yahoo.com', '345369153656684');
INSERT INTO buyer_card (email, card_no)
    VALUES ('williamsfrederick@payne.com', '2286758892220934');
INSERT INTO buyer_card (email, card_no)
    VALUES ('dwilliams@yahoo.com', '4171422261185');
INSERT INTO buyer_card (email, card_no)
    VALUES ('zwhite@boyd.com', '370855314278994');
INSERT INTO buyer_card (email, card_no)
    VALUES ('vincenttaylor@gonzalez-austin.com', '4848653357808272');
INSERT INTO buyer_card (email, card_no)
    VALUES ('nconner@parker.com', '4650712176543371020');
INSERT INTO buyer_card (email, card_no)
    VALUES ('amy34@yahoo.com', '2289321326002977');
INSERT INTO buyer_card (email, card_no)
    VALUES ('klinelinda@gallegos.org', '4645029277102275');
INSERT INTO buyer_card (email, card_no)
    VALUES ('fstewart@frazier.com', '4444065290793008');
INSERT INTO buyer_card (email, card_no)
    VALUES ('wesleymitchell@hammond.biz', '372472112232633');
INSERT INTO buyer_card (email, card_no)
    VALUES ('wileylisa@gmail.com', '3590476474430073');
INSERT INTO buyer_card (email, card_no)
    VALUES ('wesleymitchell@hammond.biz', '180077593488810');
INSERT INTO buyer_card (email, card_no)
    VALUES ('anthonyflowers@gmail.com', '30331781103554');
INSERT INTO buyer_card (email, card_no)
    VALUES ('bethanybailey@lozano.com', '4382593402300761144');
INSERT INTO buyer_card (email, card_no)
    VALUES ('chad36@hotmail.com', '6505537136570262');
INSERT INTO buyer_card (email, card_no)
    VALUES ('dbrown@arroyo.com', '4857072282858229');
INSERT INTO buyer_card (email, card_no)
    VALUES ('brandondominguez@hotmail.com', '4807256648318553691');
INSERT INTO buyer_card (email, card_no)
    VALUES ('brandon64@hotmail.com', '3508050248575942');
INSERT INTO buyer_card (email, card_no)
    VALUES ('slin@yahoo.com', '30403019229194');
INSERT INTO buyer_card (email, card_no)
    VALUES ('christopherlane@hotmail.com', '6011662698598357');
INSERT INTO buyer_card (email, card_no)
    VALUES ('vincenttaylor@gonzalez-austin.com', '4807256648318553691');
INSERT INTO buyer_card (email, card_no)
    VALUES ('melissaadams@gonzalez-mcdowell.biz', '30169335131592');
INSERT INTO buyer_card (email, card_no)
    VALUES ('lauren96@mosley.org', '4384123874398108');
INSERT INTO buyer_card (email, card_no)
    VALUES ('williamsheather@morales-brooks.biz', '36763202192952');
INSERT INTO buyer_card (email, card_no)
    VALUES ('armstrongmatthew@yahoo.com', '5169464184310336');
INSERT INTO buyer_card (email, card_no)
    VALUES ('johnsonchristopher@yahoo.com', '574562412951');
INSERT INTO buyer_card (email, card_no)
    VALUES ('lanejoan@taylor.info', '213154797361480');
INSERT INTO buyer_card (email, card_no)
    VALUES ('benjamin58@ward.com', '2231263026766056');
INSERT INTO buyer_card (email, card_no)
    VALUES ('gary19@yahoo.com', '213173088325731');
INSERT INTO buyer_card (email, card_no)
    VALUES ('clarkjonathan@yahoo.com', '3534297077872902');
INSERT INTO buyer_card (email, card_no)
    VALUES ('lanejoan@taylor.info', '4053985807164729941');
INSERT INTO buyer_card (email, card_no)
    VALUES ('samanthabrown@cox-wilson.com', '3537943540614630');
INSERT INTO buyer_card (email, card_no)
    VALUES ('eric39@yahoo.com', '180039182283010');
INSERT INTO buyer_card (email, card_no)
    VALUES ('sstanton@hotmail.com', '3543877956473069');
INSERT INTO buyer_card (email, card_no)
    VALUES ('turnermichael@yahoo.com', '213108792674370');
INSERT INTO buyer_card (email, card_no)
    VALUES ('johnsonkristina@yahoo.com', '4484412345479292107');
INSERT INTO buyer_card (email, card_no)
    VALUES ('knelson@frey.com', '6502165589609735');
INSERT INTO buyer_card (email, card_no)
    VALUES ('vancenathan@rojas.com', '3506005121054011');
INSERT INTO buyer_card (email, card_no)
    VALUES ('twillis@hotmail.com', '349104296546385');
INSERT INTO buyer_card (email, card_no)
    VALUES ('gary19@yahoo.com', '213170401248293');
INSERT INTO buyer_card (email, card_no)
    VALUES ('jeremy89@hotmail.com', '30249498563433');
INSERT INTO buyer_card (email, card_no)
    VALUES ('anthonyflowers@gmail.com', '180047844706096');
INSERT INTO buyer_card (email, card_no)
    VALUES ('johnschultz@hotmail.com', '4825247690181831');
INSERT INTO buyer_card (email, card_no)
    VALUES ('acuevas@gmail.com', '4618274224435286');
INSERT INTO buyer_card (email, card_no)
    VALUES ('lauren96@mosley.org', '2282530364950510');
INSERT INTO buyer_card (email, card_no)
    VALUES ('riverajoshua@hotmail.com', '30127113918838');
INSERT INTO buyer_card (email, card_no)
    VALUES ('alisonmichael@yahoo.com', '4207090649127813477');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kmitchell@dorsey.com', '6505537136570262');
INSERT INTO buyer_card (email, card_no)
    VALUES ('riverajoshua@hotmail.com', '340919090620428');
INSERT INTO buyer_card (email, card_no)
    VALUES ('peter44@yu.com', '4648483973460674860');
INSERT INTO buyer_card (email, card_no)
    VALUES ('narmstrong@clark-reynolds.com', '3559639914068550');
INSERT INTO buyer_card (email, card_no)
    VALUES ('edwardsjennifer@yahoo.com', '4489409811604470938');
INSERT INTO buyer_card (email, card_no)
    VALUES ('daniel43@nelson.biz', '340623031774241');
INSERT INTO buyer_card (email, card_no)
    VALUES ('masseychristian@johnson.com', '4009410794244768');
INSERT INTO buyer_card (email, card_no)
    VALUES ('aliciaryan@miller.com', '4784907845043152799');
INSERT INTO buyer_card (email, card_no)
    VALUES ('daviesashley@wells.com', '4559003986299684');
INSERT INTO buyer_card (email, card_no)
    VALUES ('daviesashley@wells.com', '6011347557518684');
INSERT INTO buyer_card (email, card_no)
    VALUES ('lauren96@mosley.org', '3531510502749963');
INSERT INTO buyer_card (email, card_no)
    VALUES ('julie67@hotmail.com', '4014302481100283');
INSERT INTO buyer_card (email, card_no)
    VALUES ('narmstrong@clark-reynolds.com', '2289321326002977');
INSERT INTO buyer_card (email, card_no)
    VALUES ('znorris@hopkins.com', '4521191352799');
INSERT INTO buyer_card (email, card_no)
    VALUES ('asullivan@pierce.com', '675969137115');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kmitchell@dorsey.com', '4521191352799');
INSERT INTO buyer_card (email, card_no)
    VALUES ('pcoleman@gmail.com', '4807256648318553691');
INSERT INTO buyer_card (email, card_no)
    VALUES ('jmyers@wright-mitchell.org', '2286758892220934');
INSERT INTO buyer_card (email, card_no)
    VALUES ('samantha06@osborne-williams.org', '180040922633472');
INSERT INTO buyer_card (email, card_no)
    VALUES ('benjamin58@ward.com', '568861960082');
INSERT INTO buyer_card (email, card_no)
    VALUES ('acuevas@gmail.com', '3584492530540522');
INSERT INTO buyer_card (email, card_no)
    VALUES ('psmith@olson-jones.com', '375116346037618');
INSERT INTO buyer_card (email, card_no)
    VALUES ('rileyrebecca@hotmail.com', '3581513357645665');
INSERT INTO buyer_card (email, card_no)
    VALUES ('romerocaleb@crawford.com', '502000194600');
INSERT INTO buyer_card (email, card_no)
    VALUES ('cgomez@yahoo.com', '3534297077872902');
INSERT INTO buyer_card (email, card_no)
    VALUES ('uperez@hotmail.com', '2242322168303099');
INSERT INTO buyer_card (email, card_no)
    VALUES ('gallagherangel@pena-russell.com', '4192359929503');
INSERT INTO buyer_card (email, card_no)
    VALUES ('jenniferroy@osborne.com', '349708752741916');
INSERT INTO buyer_card (email, card_no)
    VALUES ('howardjulie@adams.biz', '4807256648318553691');
INSERT INTO buyer_card (email, card_no)
    VALUES ('daviscristian@russo-davis.net', '2272908237254967');
INSERT INTO buyer_card (email, card_no)
    VALUES ('lisaholmes@hotmail.com', '180071363072300');
INSERT INTO buyer_card (email, card_no)
    VALUES ('comptonalan@yahoo.com', '6576064931213489');
INSERT INTO buyer_card (email, card_no)
    VALUES ('edwardsjonathan@hotmail.com', '4728069549254280');
INSERT INTO buyer_card (email, card_no)
    VALUES ('kallen@frye-dawson.com', '4171422261185');
INSERT INTO buyer_card (email, card_no)
    VALUES ('linda24@jones-compton.com', '4872139078829564');
INSERT INTO buyer_card (email, card_no)
    VALUES ('rachel68@yahoo.com', '180071363072300');
INSERT INTO buyer_card (email, card_no)
    VALUES ('derek64@yahoo.com', '180014299836414');
INSERT INTO buyer_card (email, card_no)
    VALUES ('williamsheather@morales-brooks.biz', '213165112153931');
INSERT INTO buyer_card (email, card_no)
    VALUES ('chad36@hotmail.com', '180014299836414');
INSERT INTO buyer_card (email, card_no)
    VALUES ('tracyscott@hardin-rodriguez.com', '675969137115');
INSERT INTO buyer_card (email, card_no)
    VALUES ('zwest@williams.com', '4728069549254280');
INSERT INTO buyer_card (email, card_no)
    VALUES ('ronaldprice@leonard.biz', '4689580759786495');
INSERT INTO buyer_card (email, card_no)
    VALUES ('vodonnell@griffin.biz', '4872139078829564');
INSERT INTO buyer_card (email, card_no)
    VALUES ('riverajoshua@hotmail.com', '377410820745384');
INSERT INTO buyer_card (email, card_no)
    VALUES ('ginarusso@drake-miller.com', '180041031587401');
INSERT INTO seller (email)
    VALUES ('myersmark@hotmail.com');
INSERT INTO seller (email)
    VALUES ('ecooper@yahoo.com');
INSERT INTO seller (email)
    VALUES ('tapiadavid@hall.com');
INSERT INTO seller (email)
    VALUES ('brandon64@hotmail.com');
INSERT INTO seller (email)
    VALUES ('jonathandavis@rodriguez-webster.com');
INSERT INTO seller (email)
    VALUES ('james82@hotmail.com');
INSERT INTO seller (email)
    VALUES ('vgarcia@hodge.com');
INSERT INTO seller (email)
    VALUES ('johnsonkyle@porter.biz');
INSERT INTO seller (email)
    VALUES ('johnsonmichael@gmail.com');
INSERT INTO seller (email)
    VALUES ('victoria89@yahoo.com');
INSERT INTO seller (email)
    VALUES ('romeroalexander@hotmail.com');
INSERT INTO seller (email)
    VALUES ('pthomas@gmail.com');
INSERT INTO seller (email)
    VALUES ('rwoodard@yahoo.com');
INSERT INTO seller (email)
    VALUES ('esmith@hotmail.com');
INSERT INTO seller (email)
    VALUES ('kcarter@ramirez.com');
INSERT INTO seller (email)
    VALUES ('erikagutierrez@gmail.com');
INSERT INTO seller (email)
    VALUES ('samantha06@osborne-williams.org');
INSERT INTO seller (email)
    VALUES ('ambermartinez@marsh.com');
INSERT INTO seller (email)
    VALUES ('stefanie52@lucas.com');
INSERT INTO seller (email)
    VALUES ('pittmannicholas@hotmail.com');
INSERT INTO seller (email)
    VALUES ('prodriguez@yahoo.com');
INSERT INTO seller (email)
    VALUES ('narmstrong@clark-reynolds.com');
INSERT INTO seller (email)
    VALUES ('howardjulie@adams.biz');
INSERT INTO seller (email)
    VALUES ('reesegabriel@hotmail.com');
INSERT INTO seller (email)
    VALUES ('walkeryvonne@gmail.com');
INSERT INTO seller (email)
    VALUES ('wileylisa@gmail.com');
INSERT INTO seller (email)
    VALUES ('skaufman@thomas.com');
INSERT INTO seller (email)
    VALUES ('xmyers@hotmail.com');
INSERT INTO seller (email)
    VALUES ('tracyscott@hardin-rodriguez.com');
INSERT INTO seller (email)
    VALUES ('michael71@barajas.com');
INSERT INTO seller (email)
    VALUES ('jenna75@gmail.com');
INSERT INTO seller (email)
    VALUES ('snydershaun@yahoo.com');
INSERT INTO seller (email)
    VALUES ('sean78@hodge.biz');
INSERT INTO seller (email)
    VALUES ('riverajoshua@hotmail.com');
INSERT INTO seller (email)
    VALUES ('hsolomon@cobb.com');
INSERT INTO seller (email)
    VALUES ('grace48@garrett-garza.org');
INSERT INTO seller (email)
    VALUES ('maryortiz@wright-wilson.biz');
INSERT INTO seller (email)
    VALUES ('uperez@hotmail.com');
INSERT INTO seller (email)
    VALUES ('asullivan@pierce.com');
INSERT INTO seller (email)
    VALUES ('fstewart@frazier.com');
INSERT INTO seller (email)
    VALUES ('michael54@yahoo.com');
INSERT INTO seller (email)
    VALUES ('xrivas@yahoo.com');
INSERT INTO seller (email)
    VALUES ('joseph82@williams-marsh.net');
INSERT INTO seller (email)
    VALUES ('alisonmichael@yahoo.com');
INSERT INTO seller (email)
    VALUES ('rileyrebecca@hotmail.com');
INSERT INTO seller (email)
    VALUES ('coxangela@jones.com');
INSERT INTO seller (email)
    VALUES ('armstrongmatthew@yahoo.com');
INSERT INTO seller (email)
    VALUES ('shaffermaria@yahoo.com');
INSERT INTO seller (email)
    VALUES ('kgalvan@fisher.com');
INSERT INTO seller (email)
    VALUES ('bryanttracy@bruce-brown.com');
INSERT INTO seller (email)
    VALUES ('dwilliams@yahoo.com');
INSERT INTO seller (email)
    VALUES ('vhopkins@gmail.com');
INSERT INTO seller (email)
    VALUES ('mathiskeith@white.com');
INSERT INTO seller (email)
    VALUES ('adrianbartlett@hotmail.com');
INSERT INTO seller (email)
    VALUES ('andersonmatthew@yahoo.com');
INSERT INTO seller (email)
    VALUES ('gallagherangel@pena-russell.com');
INSERT INTO seller (email)
    VALUES ('lanejoan@taylor.info');
INSERT INTO seller (email)
    VALUES ('johnsonrobert@hotmail.com');
INSERT INTO seller (email)
    VALUES ('lisaholmes@hotmail.com');
INSERT INTO seller (email)
    VALUES ('kowens@rogers-elliott.com');
INSERT INTO seller (email)
    VALUES ('kimberlythomas@gmail.com');
INSERT INTO seller (email)
    VALUES ('daviscristian@russo-davis.net');
INSERT INTO seller (email)
    VALUES ('brandondominguez@hotmail.com');
INSERT INTO seller (email)
    VALUES ('othomas@vazquez.info');
INSERT INTO seller (email)
    VALUES ('vincenttaylor@gonzalez-austin.com');
INSERT INTO seller (email)
    VALUES ('xhawkins@rowe.com');
INSERT INTO seller (email)
    VALUES ('bethanybailey@lozano.com');
INSERT INTO seller (email)
    VALUES ('masseychristian@johnson.com');
INSERT INTO seller (email)
    VALUES ('rachel68@yahoo.com');
INSERT INTO seller (email)
    VALUES ('nancyclark@yahoo.com');
INSERT INTO seller (email)
    VALUES ('christiangutierrez@may.com');
INSERT INTO seller (email)
    VALUES ('ronaldprice@leonard.biz');
INSERT INTO seller (email)
    VALUES ('luislane@gmail.com');
INSERT INTO seller (email)
    VALUES ('sacosta@li.com');
INSERT INTO seller (email)
    VALUES ('eric39@yahoo.com');
INSERT INTO seller (email)
    VALUES ('johnsonkristina@yahoo.com');
INSERT INTO seller (email)
    VALUES ('vancenathan@rojas.com');
INSERT INTO seller (email)
    VALUES ('slin@yahoo.com');
INSERT INTO seller (email)
    VALUES ('kmitchell@dorsey.com');
INSERT INTO seller (email)
    VALUES ('kristin31@yahoo.com');
INSERT INTO seller (email)
    VALUES ('parkstacy@gmail.com');
INSERT INTO seller (email)
    VALUES ('kallen@frye-dawson.com');
INSERT INTO seller (email)
    VALUES ('hatfieldjimmy@douglas.net');
INSERT INTO seller (email)
    VALUES ('gary51@yahoo.com');
INSERT INTO seller (email)
    VALUES ('joseph67@gmail.com');
INSERT INTO seller (email)
    VALUES ('javier78@berry.net');
INSERT INTO seller (email)
    VALUES ('williamsheather@morales-brooks.biz');
INSERT INTO seller (email)
    VALUES ('rmoore@hughes.com');
INSERT INTO seller (email)
    VALUES ('cooperroy@weaver.info');
INSERT INTO seller (email)
    VALUES ('amyjohnson@gmail.com');
INSERT INTO seller (email)
    VALUES ('bartonshelley@hotmail.com');
INSERT INTO seller (email)
    VALUES ('alicia64@moran.com');
INSERT INTO seller (email)
    VALUES ('rcraig@yahoo.com');
INSERT INTO seller (email)
    VALUES ('julie67@hotmail.com');
INSERT INTO seller (email)
    VALUES ('linda24@jones-compton.com');
INSERT INTO seller (email)
    VALUES ('brenda23@schaefer-jenkins.biz');
INSERT INTO seller (email)
    VALUES ('angela19@gmail.com');
INSERT INTO seller (email)
    VALUES ('benjamin58@ward.com');
INSERT INTO seller (email)
    VALUES ('uvazquez@hotmail.com');
INSERT INTO seller (email)
    VALUES ('cindygonzalez@hotmail.com');
INSERT INTO seller (email)
    VALUES ('smithtommy@brown.biz');
INSERT INTO seller (email)
    VALUES ('sonya44@reid-jones.biz');
INSERT INTO seller (email)
    VALUES ('alicia26@jones-farmer.net');
INSERT INTO seller (email)
    VALUES ('vicki85@yahoo.com');
INSERT INTO seller (email)
    VALUES ('johnschultz@hotmail.com');
INSERT INTO seller (email)
    VALUES ('iadams@proctor-hill.org');
INSERT INTO seller (email)
    VALUES ('edwardsjonathan@hotmail.com');
INSERT INTO seller (email)
    VALUES ('douglas66@gmail.com');
INSERT INTO seller (email)
    VALUES ('huntkimberly@cooper.com');
INSERT INTO seller (email)
    VALUES ('lindsayspencer@wyatt.biz');
INSERT INTO seller (email)
    VALUES ('stevenwright@barnes-vargas.com');
INSERT INTO seller (email)
    VALUES ('william12@fisher.com');
INSERT INTO seller (email)
    VALUES ('eperez@hotmail.com');
INSERT INTO seller (email)
    VALUES ('williamskatherine@yahoo.com');
INSERT INTO seller (email)
    VALUES ('paul36@goodwin.com');
INSERT INTO seller (email)
    VALUES ('rgonzalez@yahoo.com');
INSERT INTO seller (email)
    VALUES ('michaelshort@woodward-houston.com');
INSERT INTO seller (email)
    VALUES ('psmith@olson-jones.com');
INSERT INTO seller (email)
    VALUES ('chad36@hotmail.com');
INSERT INTO seller (email)
    VALUES ('rebeccaolsen@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('klinelinda@gallegos.org');
INSERT INTO buyer (email)
    VALUES ('reesegabriel@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('riverajoshua@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('jennifer30@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('gary19@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('amyjohnson@gmail.com');
INSERT INTO buyer (email)
    VALUES ('kcarter@ramirez.com');
INSERT INTO buyer (email)
    VALUES ('jenna75@gmail.com');
INSERT INTO buyer (email)
    VALUES ('hschmidt@nelson-gross.org');
INSERT INTO buyer (email)
    VALUES ('pthomas@gmail.com');
INSERT INTO buyer (email)
    VALUES ('kallen@frye-dawson.com');
INSERT INTO buyer (email)
    VALUES ('brandon64@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('ecooper@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('peter44@yu.com');
INSERT INTO buyer (email)
    VALUES ('jeremy89@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('victoria89@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('christopherlane@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('michael98@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('aliciaryan@miller.com');
INSERT INTO buyer (email)
    VALUES ('brenda23@schaefer-jenkins.biz');
INSERT INTO buyer (email)
    VALUES ('michael28@gmail.com');
INSERT INTO buyer (email)
    VALUES ('esmith@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('tchen@hernandez.com');
INSERT INTO buyer (email)
    VALUES ('stefanie52@lucas.com');
INSERT INTO buyer (email)
    VALUES ('clarkjonathan@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('waltersmichelle@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('pcoleman@gmail.com');
INSERT INTO buyer (email)
    VALUES ('sherioconnor@gmail.com');
INSERT INTO buyer (email)
    VALUES ('james62@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('sstanton@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('paulaskinner@gmail.com');
INSERT INTO buyer (email)
    VALUES ('williamssarah@hughes-hill.org');
INSERT INTO buyer (email)
    VALUES ('michaelshort@woodward-houston.com');
INSERT INTO buyer (email)
    VALUES ('masseychristian@johnson.com');
INSERT INTO buyer (email)
    VALUES ('uperez@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('xrivas@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('hillapril@jenkins.com');
INSERT INTO buyer (email)
    VALUES ('acuevas@gmail.com');
INSERT INTO buyer (email)
    VALUES ('kowens@rogers-elliott.com');
INSERT INTO buyer (email)
    VALUES ('othomas@vazquez.info');
INSERT INTO buyer (email)
    VALUES ('turnermichael@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('brandondominguez@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('linda24@jones-compton.com');
INSERT INTO buyer (email)
    VALUES ('luislane@gmail.com');
INSERT INTO buyer (email)
    VALUES ('shaffermaria@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('browncindy@cross-welch.com');
INSERT INTO buyer (email)
    VALUES ('iadams@proctor-hill.org');
INSERT INTO buyer (email)
    VALUES ('johnsonkristina@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('lauren96@mosley.org');
INSERT INTO buyer (email)
    VALUES ('maryortiz@wright-wilson.biz');
INSERT INTO buyer (email)
    VALUES ('wesleymitchell@hammond.biz');
INSERT INTO buyer (email)
    VALUES ('nconner@parker.com');
INSERT INTO buyer (email)
    VALUES ('alisonmichael@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('knelson@frey.com');
INSERT INTO buyer (email)
    VALUES ('adrianbartlett@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('yholmes@gmail.com');
INSERT INTO buyer (email)
    VALUES ('dwilliams@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('tapiadavid@hall.com');
INSERT INTO buyer (email)
    VALUES ('chad36@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('joseph67@gmail.com');
INSERT INTO buyer (email)
    VALUES ('benjamin58@ward.com');
INSERT INTO buyer (email)
    VALUES ('williamsfrederick@payne.com');
INSERT INTO buyer (email)
    VALUES ('solson@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('vincenttaylor@gonzalez-austin.com');
INSERT INTO buyer (email)
    VALUES ('johnschultz@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('cindygonzalez@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('psmith@olson-jones.com');
INSERT INTO buyer (email)
    VALUES ('alyssa53@mcgrath.com');
INSERT INTO buyer (email)
    VALUES ('angela19@gmail.com');
INSERT INTO buyer (email)
    VALUES ('anthonyflowers@gmail.com');
INSERT INTO buyer (email)
    VALUES ('andersonmatthew@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('xmyers@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('johnsonmichael@gmail.com');
INSERT INTO buyer (email)
    VALUES ('edwardsjonathan@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('slin@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('matthew89@gmail.com');
INSERT INTO buyer (email)
    VALUES ('jonathandavis@rodriguez-webster.com');
INSERT INTO buyer (email)
    VALUES ('rachel68@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('kmitchell@dorsey.com');
INSERT INTO buyer (email)
    VALUES ('allison69@gmail.com');
INSERT INTO buyer (email)
    VALUES ('armstrongmatthew@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('johnsonkyle@porter.biz');
INSERT INTO buyer (email)
    VALUES ('sacosta@li.com');
INSERT INTO buyer (email)
    VALUES ('lanejoan@taylor.info');
INSERT INTO buyer (email)
    VALUES ('williamsheather@morales-brooks.biz');
INSERT INTO buyer (email)
    VALUES ('twillis@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('hlee@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('asullivan@pierce.com');
INSERT INTO buyer (email)
    VALUES ('kgalvan@fisher.com');
INSERT INTO buyer (email)
    VALUES ('grace48@garrett-garza.org');
INSERT INTO buyer (email)
    VALUES ('kimberlyreed@baldwin-scott.com');
INSERT INTO buyer (email)
    VALUES ('oliviawallace@duncan-west.biz');
INSERT INTO buyer (email)
    VALUES ('vicki85@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('seanthompson@schneider.net');
INSERT INTO buyer (email)
    VALUES ('julie67@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('coxangela@jones.com');
INSERT INTO buyer (email)
    VALUES ('josephsmith@robertson-gonzales.org');
INSERT INTO buyer (email)
    VALUES ('bethanybailey@lozano.com');
INSERT INTO buyer (email)
    VALUES ('rcraig@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('melissaadams@gonzalez-mcdowell.biz');
INSERT INTO buyer (email)
    VALUES ('snydershaun@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('samantha06@osborne-williams.org');
INSERT INTO buyer (email)
    VALUES ('huntkimberly@cooper.com');
INSERT INTO buyer (email)
    VALUES ('johnsonrobert@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('zwest@williams.com');
INSERT INTO buyer (email)
    VALUES ('william12@fisher.com');
INSERT INTO buyer (email)
    VALUES ('zachary98@lee.com');
INSERT INTO buyer (email)
    VALUES ('gary51@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('ambermartinez@marsh.com');
INSERT INTO buyer (email)
    VALUES ('williamskatherine@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('jenniferroy@osborne.com');
INSERT INTO buyer (email)
    VALUES ('colleenhaynes@gray-wade.info');
INSERT INTO buyer (email)
    VALUES ('philip98@bishop.com');
INSERT INTO buyer (email)
    VALUES ('fstewart@frazier.com');
INSERT INTO buyer (email)
    VALUES ('tracy75@thomas.com');
INSERT INTO buyer (email)
    VALUES ('amy28@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('alicia26@jones-farmer.net');
INSERT INTO buyer (email)
    VALUES ('nancyclark@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('znorris@hopkins.com');
INSERT INTO buyer (email)
    VALUES ('bryantjeffery@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('romerocaleb@crawford.com');
INSERT INTO buyer (email)
    VALUES ('james82@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('erikagutierrez@gmail.com');
INSERT INTO buyer (email)
    VALUES ('walkeryvonne@gmail.com');
INSERT INTO buyer (email)
    VALUES ('tracyscott@hardin-rodriguez.com');
INSERT INTO buyer (email)
    VALUES ('michael54@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('mahoneyolivia@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('daviesashley@wells.com');
INSERT INTO buyer (email)
    VALUES ('alicia64@moran.com');
INSERT INTO buyer (email)
    VALUES ('charlesfoster@vega-mendoza.com');
INSERT INTO buyer (email)
    VALUES ('fcoleman@gmail.com');
INSERT INTO buyer (email)
    VALUES ('rmoore@hughes.com');
INSERT INTO buyer (email)
    VALUES ('alvaradomeghan@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('vancenathan@rojas.com');
INSERT INTO buyer (email)
    VALUES ('kristin31@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('johnsonchristopher@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('javier78@berry.net');
INSERT INTO buyer (email)
    VALUES ('pittmannicholas@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('prodriguez@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('hatfieldjimmy@douglas.net');
INSERT INTO buyer (email)
    VALUES ('jmyers@wright-mitchell.org');
INSERT INTO buyer (email)
    VALUES ('stevenwright@barnes-vargas.com');
INSERT INTO buyer (email)
    VALUES ('mathiskeith@white.com');
INSERT INTO buyer (email)
    VALUES ('xhawkins@rowe.com');
INSERT INTO buyer (email)
    VALUES ('zwhite@boyd.com');
INSERT INTO buyer (email)
    VALUES ('snyderhailey@gmail.com');
INSERT INTO buyer (email)
    VALUES ('vhopkins@gmail.com');
INSERT INTO buyer (email)
    VALUES ('moyermelanie@aguilar.com');
INSERT INTO buyer (email)
    VALUES ('daniel43@nelson.biz');
INSERT INTO buyer (email)
    VALUES ('vodonnell@griffin.biz');
INSERT INTO buyer (email)
    VALUES ('joseph82@williams-marsh.net');
INSERT INTO buyer (email)
    VALUES ('rgonzalez@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('lindsayspencer@wyatt.biz');
INSERT INTO buyer (email)
    VALUES ('ginarusso@drake-miller.com');
INSERT INTO buyer (email)
    VALUES ('cooperroy@weaver.info');
INSERT INTO buyer (email)
    VALUES ('bartonshelley@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('wileylisa@gmail.com');
INSERT INTO buyer (email)
    VALUES ('comptonalan@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('howardjulie@adams.biz');
INSERT INTO buyer (email)
    VALUES ('vgarcia@hodge.com');
INSERT INTO buyer (email)
    VALUES ('sonya44@reid-jones.biz');
INSERT INTO buyer (email)
    VALUES ('bryanttracy@bruce-brown.com');
INSERT INTO buyer (email)
    VALUES ('christiangutierrez@may.com');
INSERT INTO buyer (email)
    VALUES ('dbrown@arroyo.com');
INSERT INTO buyer (email)
    VALUES ('skaufman@thomas.com');
INSERT INTO buyer (email)
    VALUES ('smithtommy@brown.biz');
INSERT INTO buyer (email)
    VALUES ('edwardsjennifer@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('eperez@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('cgomez@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('gallagherangel@pena-russell.com');
INSERT INTO buyer (email)
    VALUES ('wmcconnell@brown.org');
INSERT INTO buyer (email)
    VALUES ('slawson@fisher.com');
INSERT INTO buyer (email)
    VALUES ('derek64@yahoo.com');
INSERT INTO buyer (email)
    VALUES ('sean78@hodge.biz');
INSERT INTO buyer (email)
    VALUES ('cbryant@gmail.com');
INSERT INTO buyer (email)
    VALUES ('michael71@barajas.com');
INSERT INTO buyer (email)
    VALUES ('tdominguez@jensen.biz');
INSERT INTO buyer (email)
    VALUES ('parkstacy@gmail.com');
INSERT INTO buyer (email)
    VALUES ('myersmark@hotmail.com');
INSERT INTO buyer (email)
    VALUES ('xbarker@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Williams, Sandoval and Chaney', 'hsolomon@cobb.com');
INSERT INTO store (name, seller_email)
    VALUES ('Lee, Hunter and Ford', 'williamsheather@morales-brooks.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Byrd, Gonzalez and Duncan', 'vincenttaylor@gonzalez-austin.com');
INSERT INTO store (name, seller_email)
    VALUES ('Anderson-Watkins', 'brandon64@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Vasquez and Sons', 'rileyrebecca@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Ross PLC', 'xhawkins@rowe.com');
INSERT INTO store (name, seller_email)
    VALUES ('Hicks, Schroeder and Valdez', 'johnsonkyle@porter.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Bryant-Hernandez', 'alicia26@jones-farmer.net');
INSERT INTO store (name, seller_email)
    VALUES ('Shannon-Shaw', 'grace48@garrett-garza.org');
INSERT INTO store (name, seller_email)
    VALUES ('Carlson LLC', 'julie67@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Graham-Ochoa', 'bethanybailey@lozano.com');
INSERT INTO store (name, seller_email)
    VALUES ('Simon Group', 'tapiadavid@hall.com');
INSERT INTO store (name, seller_email)
    VALUES ('Lee Group', 'michaelshort@woodward-houston.com');
INSERT INTO store (name, seller_email)
    VALUES ('Knox and Sons', 'james82@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Williams, Davis and Powell', 'mathiskeith@white.com');
INSERT INTO store (name, seller_email)
    VALUES ('Holmes PLC', 'daviscristian@russo-davis.net');
INSERT INTO store (name, seller_email)
    VALUES ('Chen-Hawkins', 'brandon64@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Erickson, Cooke and Solomon', 'bartonshelley@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Ibarra, Green and Flores', 'angela19@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Patton Group', 'maryortiz@wright-wilson.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Rodriguez Inc', 'williamskatherine@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Ellison-Russell', 'reesegabriel@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Gallegos Group', 'michael71@barajas.com');
INSERT INTO store (name, seller_email)
    VALUES ('Hines-Miller', 'lindsayspencer@wyatt.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Carter-Bell', 'kristin31@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Davis, Bentley and Clark', 'brandondominguez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Torres-Morrow', 'sacosta@li.com');
INSERT INTO store (name, seller_email)
    VALUES ('Holloway PLC', 'johnsonkyle@porter.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Mitchell, Vang and Little', 'paul36@goodwin.com');
INSERT INTO store (name, seller_email)
    VALUES ('Parsons, Mccarthy and Schneider', 'uperez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Lowe, Pacheco and Smith', 'snydershaun@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Joyce PLC', 'johnsonrobert@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Fritz-Lee', 'lisaholmes@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Cantu-Carrillo', 'howardjulie@adams.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Arnold LLC', 'riverajoshua@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Owen, Jones and Terrell', 'prodriguez@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Thompson, Mcfarland and Reilly', 'adrianbartlett@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Frey Group', 'hatfieldjimmy@douglas.net');
INSERT INTO store (name, seller_email)
    VALUES ('Herrera, Park and Gallegos', 'linda24@jones-compton.com');
INSERT INTO store (name, seller_email)
    VALUES ('Ramsey PLC', 'fstewart@frazier.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wallace-Hernandez', 'bethanybailey@lozano.com');
INSERT INTO store (name, seller_email)
    VALUES ('Nash, Woodard and Contreras', 'paul36@goodwin.com');
INSERT INTO store (name, seller_email)
    VALUES ('Thomas, Clark and Barker', 'ecooper@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Nelson Inc', 'michaelshort@woodward-houston.com');
INSERT INTO store (name, seller_email)
    VALUES ('Johnson-Robbins', 'uperez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Miller, Palmer and Brooks', 'edwardsjonathan@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Spencer, Brown and Murray', 'gary51@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Gomez, Gonzalez and Johnson', 'xrivas@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Owens Ltd', 'parkstacy@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Baldwin-Figueroa', 'vancenathan@rojas.com');
INSERT INTO store (name, seller_email)
    VALUES ('Lewis-Decker', 'skaufman@thomas.com');
INSERT INTO store (name, seller_email)
    VALUES ('Day, Mendez and Bradley', 'michaelshort@woodward-houston.com');
INSERT INTO store (name, seller_email)
    VALUES ('Schroeder-Williams', 'reesegabriel@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Callahan, Neal and Garcia', 'amyjohnson@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Miller, Webb and Rice', 'jonathandavis@rodriguez-webster.com');
INSERT INTO store (name, seller_email)
    VALUES ('Pace Ltd', 'gary51@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Mckay Group', 'fstewart@frazier.com');
INSERT INTO store (name, seller_email)
    VALUES ('Lewis LLC', 'parkstacy@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Jones-Perez', 'linda24@jones-compton.com');
INSERT INTO store (name, seller_email)
    VALUES ('Humphrey-Anderson', 'slin@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Allison-Rodriguez', 'othomas@vazquez.info');
INSERT INTO store (name, seller_email)
    VALUES ('Holloway Ltd', 'psmith@olson-jones.com');
INSERT INTO store (name, seller_email)
    VALUES ('Hernandez Ltd', 'tapiadavid@hall.com');
INSERT INTO store (name, seller_email)
    VALUES ('Daugherty Inc', 'andersonmatthew@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wang PLC', 'prodriguez@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wells-Perkins', 'gallagherangel@pena-russell.com');
INSERT INTO store (name, seller_email)
    VALUES ('Duran, Perez and Adkins', 'hatfieldjimmy@douglas.net');
INSERT INTO store (name, seller_email)
    VALUES ('Stephens Ltd', 'alisonmichael@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Dunn, Bowman and Simmons', 'kristin31@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Williams LLC', 'maryortiz@wright-wilson.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Stanton and Sons', 'william12@fisher.com');
INSERT INTO store (name, seller_email)
    VALUES ('Hall Ltd', 'rwoodard@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Moore PLC', 'williamskatherine@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Washington, Butler and Espinoza', 'romeroalexander@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Collier Group', 'edwardsjonathan@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Warren-Waters', 'sacosta@li.com');
INSERT INTO store (name, seller_email)
    VALUES ('Gilbert, Bennett and Gutierrez', 'julie67@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Gonzalez, Green and Barrera', 'adrianbartlett@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Berger and Sons', 'luislane@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Maynard-Smith', 'paul36@goodwin.com');
INSERT INTO store (name, seller_email)
    VALUES ('Patel PLC', 'joseph82@williams-marsh.net');
INSERT INTO store (name, seller_email)
    VALUES ('Hernandez, Stark and Garrett', 'masseychristian@johnson.com');
INSERT INTO store (name, seller_email)
    VALUES ('Cooke, Robbins and Murray', 'bartonshelley@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Salazar, Hughes and Moreno', 'slin@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Stevenson-Smith', 'jonathandavis@rodriguez-webster.com');
INSERT INTO store (name, seller_email)
    VALUES ('Johnson-Thomas', 'joseph67@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Tanner-Taylor', 'alicia26@jones-farmer.net');
INSERT INTO store (name, seller_email)
    VALUES ('Salazar, Morris and Carpenter', 'mathiskeith@white.com');
INSERT INTO store (name, seller_email)
    VALUES ('Pearson, Griffin and Kerr', 'lanejoan@taylor.info');
INSERT INTO store (name, seller_email)
    VALUES ('Wheeler-Silva', 'masseychristian@johnson.com');
INSERT INTO store (name, seller_email)
    VALUES ('Cannon-Jones', 'reesegabriel@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Anderson Ltd', 'vhopkins@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Dennis, Nunez and Stewart', 'esmith@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Arnold, Rivera and Moyer', 'ronaldprice@leonard.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Lewis Inc', 'rgonzalez@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Jackson Ltd', 'bethanybailey@lozano.com');
INSERT INTO store (name, seller_email)
    VALUES ('Woodward-Miller', 'joseph82@williams-marsh.net');
INSERT INTO store (name, seller_email)
    VALUES ('Vazquez-Lutz', 'gary51@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Lewis, Hernandez and Snow', 'johnsonkristina@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Johnson Inc', 'bethanybailey@lozano.com');
INSERT INTO store (name, seller_email)
    VALUES ('Ray Group', 'rachel68@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wells-Morales', 'walkeryvonne@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wells-Jackson', 'gary51@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Dixon Group', 'bethanybailey@lozano.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wright, Wright and Waller', 'rwoodard@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Case and Sons', 'dwilliams@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Cook PLC', 'pthomas@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Neal Inc', 'michael54@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Marks Group', 'amyjohnson@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Barry, Phillips and Osborn', 'xhawkins@rowe.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wallace Ltd', 'samantha06@osborne-williams.org');
INSERT INTO store (name, seller_email)
    VALUES ('Ford PLC', 'kallen@frye-dawson.com');
INSERT INTO store (name, seller_email)
    VALUES ('Jones, Vincent and Rios', 'lindsayspencer@wyatt.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Adams-Taylor', 'victoria89@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Hood-Jones', 'hatfieldjimmy@douglas.net');
INSERT INTO store (name, seller_email)
    VALUES ('Yoder Group', 'hatfieldjimmy@douglas.net');
INSERT INTO store (name, seller_email)
    VALUES ('Sanchez Inc', 'joseph82@williams-marsh.net');
INSERT INTO store (name, seller_email)
    VALUES ('Brown-Norton', 'rcraig@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Manning Inc', 'edwardsjonathan@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Franco Group', 'kmitchell@dorsey.com');
INSERT INTO store (name, seller_email)
    VALUES ('Thomas Ltd', 'daviscristian@russo-davis.net');
INSERT INTO store (name, seller_email)
    VALUES ('Velazquez-Contreras', 'riverajoshua@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Vaughn PLC', 'huntkimberly@cooper.com');
INSERT INTO store (name, seller_email)
    VALUES ('Mills, Roberson and Goodman', 'william12@fisher.com');
INSERT INTO store (name, seller_email)
    VALUES ('Miller-Evans', 'uvazquez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('White PLC', 'victoria89@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Cook Ltd', 'johnsonmichael@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Short LLC', 'michaelshort@woodward-houston.com');
INSERT INTO store (name, seller_email)
    VALUES ('Bryant, Burton and Rojas', 'slin@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Peterson-Brown', 'johnsonrobert@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Fields PLC', 'cindygonzalez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wilson-Edwards', 'kmitchell@dorsey.com');
INSERT INTO store (name, seller_email)
    VALUES ('Haney Ltd', 'eperez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Brown-Jones', 'ecooper@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Campbell, Davidson and Jackson', 'coxangela@jones.com');
INSERT INTO store (name, seller_email)
    VALUES ('Hopkins, Castillo and Winters', 'jonathandavis@rodriguez-webster.com');
INSERT INTO store (name, seller_email)
    VALUES ('Bates, Foster and Hart', 'johnsonkristina@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Flores-Andrews', 'kmitchell@dorsey.com');
INSERT INTO store (name, seller_email)
    VALUES ('Ramos LLC', 'xmyers@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Crosby-Black', 'esmith@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Hale, Ford and Castillo', 'vicki85@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Cox Inc', 'javier78@berry.net');
INSERT INTO store (name, seller_email)
    VALUES ('Kelly, Smith and Wells', 'johnsonrobert@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Washington-Gonzalez', 'amyjohnson@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Garcia Inc', 'christiangutierrez@may.com');
INSERT INTO store (name, seller_email)
    VALUES ('Adkins Ltd', 'howardjulie@adams.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Wilson-Stout', 'psmith@olson-jones.com');
INSERT INTO store (name, seller_email)
    VALUES ('Kemp-Hodges', 'sacosta@li.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wright, Bowman and Wells', 'james82@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Black LLC', 'hsolomon@cobb.com');
INSERT INTO store (name, seller_email)
    VALUES ('Contreras, Lynch and Foster', 'vincenttaylor@gonzalez-austin.com');
INSERT INTO store (name, seller_email)
    VALUES ('Gonzalez, Green and Lowe', 'edwardsjonathan@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Duncan-Garcia', 'williamsheather@morales-brooks.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Jones-Duncan', 'angela19@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Anderson, Reid and Jones', 'eric39@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Gross Group', 'johnschultz@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Higgins Ltd', 'vhopkins@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Carrillo-Wilson', 'fstewart@frazier.com');
INSERT INTO store (name, seller_email)
    VALUES ('Scott, Duncan and Palmer', 'eric39@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Fox, Bailey and Scott', 'kristin31@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Payne, Ruiz and Valentine', 'jonathandavis@rodriguez-webster.com');
INSERT INTO store (name, seller_email)
    VALUES ('Anderson LLC', 'joseph67@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Shaw-Smith', 'sacosta@li.com');
INSERT INTO store (name, seller_email)
    VALUES ('Villegas-Ramsey', 'hatfieldjimmy@douglas.net');
INSERT INTO store (name, seller_email)
    VALUES ('Mcdowell LLC', 'alisonmichael@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Smith, Hampton and Welch', 'stevenwright@barnes-vargas.com');
INSERT INTO store (name, seller_email)
    VALUES ('Martin PLC', 'nancyclark@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Mcbride-Martin', 'alisonmichael@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Tyler-Mitchell', 'linda24@jones-compton.com');
INSERT INTO store (name, seller_email)
    VALUES ('Haas-Martinez', 'xmyers@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Wise-Smith', 'pthomas@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Norman-Rivera', 'bethanybailey@lozano.com');
INSERT INTO store (name, seller_email)
    VALUES ('Koch-Porter', 'uvazquez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Flowers, Young and Russell', 'snydershaun@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Barnes, Gallagher and Black', 'rebeccaolsen@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Walker Ltd', 'rwoodard@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Hester-Blackburn', 'cindygonzalez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Bolton Inc', 'asullivan@pierce.com');
INSERT INTO store (name, seller_email)
    VALUES ('Thomas, Parker and Wright', 'tapiadavid@hall.com');
INSERT INTO store (name, seller_email)
    VALUES ('Davis PLC', 'johnsonmichael@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Davidson-Wyatt', 'romeroalexander@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Stephens, Davis and Jordan', 'brandon64@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Jones-Ortiz', 'douglas66@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Kelly, Henry and Smith', 'asullivan@pierce.com');
INSERT INTO store (name, seller_email)
    VALUES ('Garcia-Reed', 'ronaldprice@leonard.biz');
INSERT INTO store (name, seller_email)
    VALUES ('Williams PLC', 'kmitchell@dorsey.com');
INSERT INTO store (name, seller_email)
    VALUES ('Meza, Hines and Bailey', 'rileyrebecca@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Barron, Adams and Reilly', 'kristin31@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Vance and Sons', 'rmoore@hughes.com');
INSERT INTO store (name, seller_email)
    VALUES ('Smith Inc', 'parkstacy@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Woods-Schwartz', 'johnschultz@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Rice-Gentry', 'gallagherangel@pena-russell.com');
INSERT INTO store (name, seller_email)
    VALUES ('Palmer Group', 'kmitchell@dorsey.com');
INSERT INTO store (name, seller_email)
    VALUES ('Gutierrez PLC', 'cindygonzalez@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Kennedy LLC', 'tapiadavid@hall.com');
INSERT INTO store (name, seller_email)
    VALUES ('Castillo-Moran', 'dwilliams@yahoo.com');
INSERT INTO store (name, seller_email)
    VALUES ('Gonzalez and Sons', 'lisaholmes@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('White, Martin and Brooks', 'pthomas@gmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Williams Inc', 'xmyers@hotmail.com');
INSERT INTO store (name, seller_email)
    VALUES ('Villanueva-Maxwell', 'romeroalexander@hotmail.com');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XMMDEQZECUBMWVS8', 28, 44, 'monetize user-centric e-tailers', 'No middle stage general film.', 'books', 'flac', 294, 'Neal Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('GF4IPWZXNXZNUJM', 45, 43, 'deliver collaborative models', 'Gas sport plan side feeling continue political.', 'code', 'pdf', 5104, 'Daugherty Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('GVU0CP56W22SHL', 31, 44, 'target integrated eyeballs', 'Today report perhaps.', 'music', 'css', 4625, 'Patel PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('O7QS8WMH8LONPN7YJ', 39, 11, 'reinvent user-centric web-readiness', 'Dream reveal great.', 'games', 'csv', 9312, 'Anderson Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('S7GNQ742EN7', 27, 39, 'syndicate efficient web-readiness', 'Ready check will food.', 'code', 'flac', 3660, 'Salazar, Hughes and Moreno');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('56E0F3JOJJDS45YBX1N', 27, 40, 'implement strategic communities', 'Office specific audience result plant worry really southern.', 'tools', 'mp3', 3103, 'Ramsey PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('NKUPQ7U18D994E', 10, 9, 'benchmark distributed web-readiness', 'Station like go simply why.', 'tools', 'mp4', 7720, 'Lewis Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5A2HLJ6P', 19, 41, 'transform collaborative networks', 'Reality economy real man box Democrat drop.', 'books', 'jpeg', 7359, 'Jones-Perez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('LHK0T9S', 47, 20, 'facilitate cross-media initiatives', 'Action garden compare response anyone wall.', 'code', 'webm', 2725, 'Gomez, Gonzalez and Johnson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('VBMSWQECXWSDL7J', 3, 25, 'transform leading-edge technologies', 'College especially project realize.', 'art', 'png', 6660, 'Bryant-Hernandez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('YTT6USN5BCYA', 35, 44, 'syndicate revolutionary relationships', 'Cold process section upon hour group radio.', 'documents', 'mov', 9657, 'Kennedy LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('NS1I9XWC', 40, 19, 'e-enable wireless deliverables', 'Price entire relationship total body.', 'books', 'avi', 5602, 'Marks Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('99QTL5HHJXO8BAPA55VO', 11, 6, 'enhance scalable solutions', 'Item everybody song sense size.', 'games', 'wav', 3855, 'Wright, Bowman and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('IDAWON', 36, 2, 'target ubiquitous metrics', 'Necessary education word respond he under truth.', 'documents', 'numbers', 2341, 'Barron, Adams and Reilly');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('M79CEQBO', 26, 49, 'morph value-added vortals', 'Food record door real.', 'documents', 'css', 5392, 'Haas-Martinez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('C6TPIU7QZ4W3XY9', 19, 32, 'enhance value-added synergies', 'Dark leader quickly food chance table.', 'tools', 'js', 8385, 'Dunn, Bowman and Simmons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MQ8F85J465QUJDU4RLTD', 35, 4, 'deploy value-added bandwidth', 'Design exist under bit prevent water industry improve.', 'documents', 'numbers', 513, 'Callahan, Neal and Garcia');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('D31Z42Z', 13, 39, 'enhance end-to-end interfaces', 'Garden step involve while pull mouth.', 'misc', 'webm', 2294, 'Castillo-Moran');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('N55RS7PHXKJZ283K', 50, 5, 'orchestrate dot-com models', 'Exactly company my family them account.', 'misc', 'mp3', 1262, 'Lewis-Decker');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('QQEYO7KC8BSL5FJ', 45, 34, 'expedite robust networks', 'Difference may major now financial.', 'books', 'numbers', 3967, 'Daugherty Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('9TD3D26HXZKO1G0HIE5', 49, 20, 're-intermediate virtual functionalities', 'Movement share morning official hard accept strong.', 'code', 'wav', 8562, 'Schroeder-Williams');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CWO0WGF5R', 41, 21, 'incentivize B2B mindshare', 'Very around fast environmental whom.', 'images', 'xls', 2269, 'Cook Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('LGHJM2WK9TCOOI4MJEE', 17, 35, 'enable e-business convergence', 'Authority evening option sport fast.', 'games', 'flac', 4475, 'Ford PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('OOCLVBBZCZIG', 45, 40, 'synthesize turn-key experiences', 'Act between investment set.', 'tools', 'mov', 1819, 'Palmer Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('VNFQD1PRQSES92H', 45, 33, 'enable holistic niches', 'High fund glass tax type.', 'documents', 'webm', 411, 'Fritz-Lee');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MA4BF371H1LMWOCJ', 41, 23, 'synthesize compelling experiences', 'Artist way become natural recognize able author Democrat.', 'music', 'ods', 2151, 'Ellison-Russell');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('II6VD1', 30, 34, 'iterate cutting-edge e-commerce', 'Reach run glass expect why tell.', 'books', 'json', 9485, 'Johnson-Thomas');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('VPKLW00GUMQ89S7QV', 49, 44, 'syndicate enterprise paradigms', 'Expert understand smile course people available.', 'documents', 'ods', 1928, 'Campbell, Davidson and Jackson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('OQ3J8K5O6JQ', 20, 48, 'benchmark one-to-one e-services', 'Education democratic with share sea never then.', 'tools', 'wav', 7290, 'Williams PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WVYMG3GV', 36, 4, 'optimize B2C supply-chains', 'Sound form side us trip believe of.', 'music', 'flac', 5812, 'Tanner-Taylor');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MUJZQQ', 2, 46, 'drive sticky functionalities', 'Type at imagine network long can.', 'art', 'mp4', 8179, 'Torres-Morrow');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('EHMPBT02NO4LGPA', 31, 19, 'aggregate sticky partnerships', 'More yeah even increase building technology.', 'misc', 'avi', 5038, 'Kemp-Hodges');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('S1K5SO8KVT5DEA1', 5, 22, 'engineer one-to-one bandwidth', 'Million late glass guy nothing light fear.', 'books', 'mp4', 9701, 'Haney Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BKWTLRI9EO23T4J63345P', 2, 19, 'leverage synergistic partnerships', 'Season artist still themselves meet such.', 'music', 'mov', 160, 'Davis PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CJ8GR5XGB9XNXCW4LKME', 38, 33, 'deploy cross-platform platforms', 'Trial center government card face.', 'images', 'mp3', 9752, 'Wright, Wright and Waller');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('PRBQVB3CP8C', 17, 15, 'embrace dynamic action-items', 'Start serious still letter church this lot must.', 'music', 'pages', 9595, 'Holloway Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('L9HEMTXMNU1S8JULJX', 9, 7, 'transform robust architectures', 'Learn no outside.', 'art', 'mp3', 759, 'Pearson, Griffin and Kerr');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('EA4RXFRYJTRY', 18, 8, 'productize plug-and-play portals', 'Manage never least.', 'games', 'css', 4368, 'Vasquez and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('QSP89T0I9JLS', 38, 33, 'revolutionize e-business solutions', 'Go best develop think kid hit yes.', 'images', 'png', 9899, 'Holmes PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('DLTZVZJ', 41, 46, 'matrix cross-media infrastructures', 'Control two treat couple.', 'code', 'css', 3366, 'Campbell, Davidson and Jackson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('T3RTSEYP98CYC1TYM', 49, 9, 'incubate bricks-and-clicks communities', 'Media factor service often control think.', 'misc', 'wav', 3322, 'Byrd, Gonzalez and Duncan');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('67IEX5TA4Z39PC', 10, 23, 'expedite holistic eyeballs', 'Could carry send still.', 'misc', 'css', 5575, 'Stephens Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('NB24TDA92', 44, 28, 'cultivate real-time communities', 'Sell over act personal.', 'documents', 'mp4', 4936, 'Vazquez-Lutz');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WDWIEDU09', 9, 8, 'enhance scalable schemas', 'Crime environmental tell trial sort man.', 'images', 'flac', 8242, 'Gonzalez and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('JYSNDB7QNJ62KFLHS1IME', 17, 30, 'iterate dynamic markets', 'Study total manager positive with concern money event.', 'books', 'bmp', 6467, 'Berger and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('22K2FGBX3B7MGM3D4U', 49, 43, 'synthesize ubiquitous web services', 'Fact well name old generation.', 'games', 'json', 5268, 'Warren-Waters');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UVVHVAESPAV8HXMX45', 41, 42, 'generate seamless vortals', 'Least determine wait want.', 'music', 'mp3', 7549, 'Thomas Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CXWEZJ', 18, 30, 'harness value-added solutions', 'Reveal add through.', 'tools', 'docx', 8784, 'Gilbert, Bennett and Gutierrez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('589SANB', 30, 34, 'deliver wireless architectures', 'Method she range like stop.', 'misc', 'mov', 4947, 'Anderson-Watkins');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ERZG9X', 3, 4, 'mesh robust e-markets', 'Describe century during price real without.', 'games', 'css', 1550, 'Ramos LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('EK23AQZCHC1A', 32, 42, 'disintermediate leading-edge convergence', 'Real character body.', 'games', 'wav', 6681, 'Johnson-Thomas');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UXHLXFZRSKO', 10, 20, 'leverage strategic functionalities', 'Add management Mr since word case statement million.', 'code', 'mp3', 9527, 'Case and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XZPVJMYIMHH', 37, 50, 'utilize best-of-breed content', 'Arm rise keep attorney age.', 'tools', 'mov', 9351, 'White PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('C8IA6', 21, 23, 'architect rich solutions', 'Treatment recognize dark exist over.', 'images', 'csv', 6886, 'Woods-Schwartz');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Y0D4BUL8', 14, 45, 're-intermediate cutting-edge channels', 'East suddenly step test together.', 'documents', 'mp4', 6111, 'Brown-Norton');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('62IZOU76V1EPAPZ', 18, 29, 'orchestrate vertical niches', 'Process impact national either scientist probably.', 'code', 'pdf', 8269, 'Villegas-Ramsey');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('07GN343YO8ISA6', 38, 25, 'leverage clicks-and-mortar infrastructures', 'Wear ability star goal especially reach.', 'documents', 'css', 6874, 'Mitchell, Vang and Little');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('C4D6Z4B', 13, 34, 'optimize efficient channels', 'Various read decision kid.', 'games', 'mp4', 8852, 'Duncan-Garcia');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ZGDI8EJIXNAIHAUG0V', 44, 50, 'architect clicks-and-mortar action-items', 'Above old opportunity owner past.', 'code', 'wav', 9282, 'Wright, Bowman and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('4L1DW5PKXJ55', 49, 11, 'streamline bricks-and-clicks technologies', 'Buy second land bar police.', 'misc', 'bmp', 7404, 'Cantu-Carrillo');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('32KLYLHKPTARYNOX44RGW', 26, 33, 'whiteboard frictionless architectures', 'Song when focus beautiful later.', 'documents', 'flac', 173, 'Ramsey PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('QCO6X9ETFPG15BL2', 29, 28, 'deliver killer infrastructures', 'Sport without him usually.', 'code', 'avi', 2722, 'Mills, Roberson and Goodman');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('W22SIT2WXELR', 14, 44, 'productize compelling solutions', 'Record each threat option sister choice among.', 'code', 'tiff', 8905, 'Mcdowell LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WV8XBDGHNU2CT6SY', 20, 4, 'integrate sticky relationships', 'Truth early when stuff you.', 'games', 'json', 8693, 'Jones-Duncan');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('N02AJ1BU62TVQAV', 8, 49, 'unleash wireless supply-chains', 'Especially group successful modern.', 'code', 'webm', 3999, 'Cook PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('U9DHEPXBH4CDB', 26, 28, 'seize magnetic applications', 'Blood exactly themselves rock each a.', 'music', 'csv', 4085, 'Case and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5EHJW01BU2OJ9JKJWAS', 15, 6, 'transition e-business partnerships', 'Study kid choose such pattern.', 'art', 'gif', 7308, 'Lewis, Hernandez and Snow');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('57VGLO', 39, 12, 'empower 24/365 interfaces', 'Not since develop determine budget discover pay range.', 'documents', 'txt', 5217, 'Miller, Webb and Rice');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5XOH5', 3, 1, 'disintermediate leading-edge web services', 'Ability similar artist one move expert.', 'images', 'wav', 9716, 'Fritz-Lee');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('R7BSNEKS4IGM4OVIEXLK', 5, 26, 'engage B2B markets', 'Expect friend human occur even measure western.', 'code', 'pages', 666, 'Smith, Hampton and Welch');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('FT2JICD6YB8PA4B', 8, 30, 'innovate bleeding-edge interfaces', 'Claim job so this guess financial natural.', 'music', 'webm', 8320, 'Kemp-Hodges');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BYFDK23N06Y8', 18, 31, 'revolutionize B2C metrics', 'Baby lose kid from the white.', 'games', 'js', 8598, 'Woodward-Miller');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('PPA2QBF2G', 27, 30, 'enable visionary web-readiness', 'Focus research skin player team phone.', 'books', 'gif', 4074, 'Carter-Bell');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('T2U50QCMRBF6F1275GCO5', 29, 50, 'incentivize revolutionary deliverables', 'Young notice between.', 'games', 'bmp', 9365, 'Washington-Gonzalez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5ZAB582F4YY0U37NG6P', 40, 14, 'repurpose scalable mindshare', 'Along especially officer commercial western.', 'tools', 'css', 3524, 'Shannon-Shaw');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('P3MGNX9GXNNEJT', 5, 11, 'synthesize clicks-and-mortar convergence', 'Future attention action how.', 'documents', 'mp3', 9629, 'Meza, Hines and Bailey');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('QVA2UM9VYSWZ2VV', 31, 12, 'deliver frictionless convergence', 'Source gas structure develop song life low.', 'music', 'png', 3083, 'Arnold LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ELM3O84ALTOWXZH9BYT', 40, 49, 'aggregate strategic eyeballs', 'Size white group citizen over arrive study.', 'misc', 'txt', 2485, 'Byrd, Gonzalez and Duncan');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('RRCVTYZQKRRBXM38CN1', 35, 48, 'facilitate viral action-items', 'Test professor necessary response operation room house.', 'music', 'jpeg', 8837, 'Ford PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3OT4U0OZFD95E9K', 13, 38, 'synthesize wireless users', 'Writer it wait among nation.', 'books', 'numbers', 2920, 'Vaughn PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('V9FI47R25KVSIK', 38, 19, 'seize wireless e-commerce', 'List their two.', 'misc', 'txt', 8476, 'Kelly, Smith and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('IVT7I9WFUVYNTDK', 36, 17, 'incentivize innovative communities', 'Big skin nation how term subject tonight mouth.', 'books', 'mp4', 4584, 'Hernandez, Stark and Garrett');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('J6KSOE45K2VT2WS', 9, 31, 'utilize cutting-edge systems', 'Recent true recognize individual drop.', 'documents', 'css', 7005, 'Schroeder-Williams');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('SANR15W261T', 30, 32, 'utilize e-business e-services', 'Apply people agent offer.', 'documents', 'tiff', 1776, 'Nelson Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('53F6XOJ1JUIB', 51, 13, 'facilitate visionary content', 'Another push wall trouble level pull include.', 'documents', 'jpeg', 1544, 'Cantu-Carrillo');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('4HUT9MXQB8PGY2KBAL', 35, 7, 'e-enable intuitive e-commerce', 'Once decision feeling specific city natural.', 'images', 'mp3', 8494, 'Vasquez and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('QYJ6CP', 18, 9, 'optimize back-end convergence', 'Mission other some within conference.', 'images', 'wav', 2558, 'Cook PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CZFJ09QE', 46, 38, 'streamline out-of-the-box channels', 'Under suggest article night couple learn.', 'tools', 'bmp', 83, 'Gilbert, Bennett and Gutierrez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('97N27TIYC', 2, 38, 're-intermediate next-generation interfaces', 'Maintain particularly our direction.', 'images', 'key', 8780, 'Crosby-Black');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('1XSJFSKVS6C8', 39, 36, 'facilitate open-source applications', 'Show understand near just tonight herself.', 'music', 'csv', 9273, 'Simon Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('M95K5K9QZ', 50, 31, 'aggregate extensible schemas', 'One car none different without thus without suddenly.', 'books', 'png', 4184, 'Lewis Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MT9WD29UG1D8JKZXYHBR', 41, 37, 'empower cross-media platforms', 'Those thought recently doctor the.', 'images', 'mp3', 6472, 'Davis PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2K7X7R3APTU1FDLSP84', 39, 31, 'revolutionize collaborative architectures', 'Husband statement compare.', 'documents', 'png', 9026, 'Villanueva-Maxwell');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2BSZUM5KAOR9G5GXMZ', 29, 42, 'deliver visionary experiences', 'For probably base lead.', 'misc', 'avi', 5085, 'Lewis LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('0BFMVYU3NOGELDTTJC', 51, 51, 'seize mission-critical interfaces', 'Clearly green later discover.', 'documents', 'mp4', 375, 'Patel PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('RSO05ATN6DZQ9I', 4, 31, 'embrace strategic e-commerce', 'Central later million need.', 'images', 'pdf', 5821, 'Wells-Morales');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2ZYIUXLHU7ORABUN6Y', 6, 15, 'whiteboard clicks-and-mortar web-readiness', 'Fund result letter vote model certain poor century.', 'games', 'avi', 1897, 'Chen-Hawkins');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('APVBWS1XK7E', 3, 7, 'extend compelling schemas', 'May year edge.', 'art', 'flac', 2260, 'Bates, Foster and Hart');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ZT29H850LSWEYUZ3SSAZU', 4, 28, 'facilitate holistic web services', 'Up it describe woman night.', 'documents', 'pptx', 5091, 'Franco Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MQC9YX5NTF169OM1', 8, 31, 'drive sticky ROI', 'And end glass rock character soon happen.', 'images', 'mov', 8165, 'Tyler-Mitchell');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('90K8LVI', 11, 10, 'reinvent distributed action-items', 'Town friend north himself reduce.', 'images', 'gif', 8853, 'Anderson LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('W4GWGW5T9D8MKGC23', 1, 46, 'engage leading-edge solutions', 'Sit account shoulder concern anyone second develop care.', 'documents', 'css', 1471, 'Crosby-Black');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('SGDU4TYC3Z2CTBO02O', 26, 11, 'target scalable content', 'Dark film maybe drop recognize.', 'music', 'html', 4834, 'Wright, Bowman and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('O0AJGLWV5YIJSHGE3', 16, 12, 'e-enable cross-platform eyeballs', 'Simple value center central heart available general statement.', 'music', 'xls', 57, 'Knox and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UDWHX1O6B', 16, 38, 'morph bleeding-edge interfaces', 'Office consumer moment note can.', 'misc', 'xls', 5950, 'Kelly, Smith and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('QYYXP', 18, 48, 'syndicate viral info-mediaries', 'Me always weight cost describe.', 'games', 'odp', 2851, 'Adkins Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('RAONEMJLR17H5', 47, 46, 'scale dynamic portals', 'Future choice case month until carry.', 'books', 'mov', 6801, 'Salazar, Hughes and Moreno');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('A9ACTJAH3F', 35, 12, 'aggregate front-end functionalities', 'Have serious own should man Congress music program.', 'games', 'jpg', 2456, 'Garcia Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('36T1VGU3G0LYF', 1, 48, 'implement holistic convergence', 'Best old fire act word.', 'art', 'ppt', 8687, 'Patel PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3EERUKR5EZZUJRL6', 2, 46, 'cultivate intuitive infrastructures', 'Care wife home style draw coach people others.', 'music', 'avi', 507, 'Anderson, Reid and Jones');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WGPHLEQ', 41, 29, 'morph extensible mindshare', 'Rich some cause within into world image improve.', 'images', 'html', 3281, 'Gomez, Gonzalez and Johnson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Y5X3BG429E28TN', 26, 7, 'unleash end-to-end partnerships', 'Couple rest part focus few soon.', 'misc', 'flac', 5174, 'Gonzalez, Green and Barrera');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('D3KWLC77', 8, 30, 'seize extensible initiatives', 'Rise rise success.', 'tools', 'numbers', 702, 'Cook PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('7NFADWE0UFFHJAVV', 34, 25, 'synthesize global functionalities', 'Read field night word media special idea.', 'music', 'png', 3218, 'Hernandez Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MF44FFETGVBGI2L506L', 33, 21, 'transform robust eyeballs', 'Try response forget charge six raise.', 'books', 'avi', 5056, 'Johnson Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('F56V57VNWTG0PEW', 30, 25, 'innovate extensible vortals', 'Practice option consumer career military.', 'misc', 'mp3', 4801, 'Sanchez Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('8871TAL4EDLF5BCYGA5S', 11, 38, 'visualize magnetic web services', 'Anyone sort doctor heavy sense newspaper animal.', 'books', 'js', 1356, 'Lewis-Decker');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3C0DV9JO5RS5F', 4, 6, 'envisioneer cross-platform portals', 'Respond record continue international anyone new hotel.', 'books', 'bmp', 3992, 'Stevenson-Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('S1E2GSVTJQ8FDCMKRRGI', 31, 17, 'innovate extensible solutions', 'Development keep money.', 'books', 'docx', 2415, 'Pearson, Griffin and Kerr');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('F0U1TA', 4, 18, 'redefine world-class users', 'Goal situation speech old idea.', 'games', 'csv', 1703, 'Pearson, Griffin and Kerr');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Z4QYNGYHM7GFKULCOI2UL', 43, 11, 'transition world-class e-services', 'Chair bill cost purpose when only.', 'books', 'html', 9782, 'Wells-Jackson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('HSBGDO', 44, 33, 'benchmark open-source eyeballs', 'Others film so beyond step thousand.', 'games', 'flac', 9695, 'Erickson, Cooke and Solomon');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('QIO1AG64EYG02PKZEF6', 49, 29, 'syndicate value-added architectures', 'Thank others street should.', 'tools', 'txt', 292, 'White, Martin and Brooks');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Y883RPGH7U', 15, 12, 'morph dot-com applications', 'Finally down public.', 'misc', 'flac', 6185, 'Sanchez Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('EGDFF193GSKZX', 21, 10, 'morph frictionless systems', 'Someone into find sign here use life owner.', 'tools', 'webm', 1635, 'Fox, Bailey and Scott');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('HXQOFUOQ', 2, 2, 'engineer magnetic interfaces', 'Less religious attention trial just.', 'art', 'odp', 2209, 'Jones-Ortiz');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('O8UDLDAO', 2, 1, 'seize innovative systems', 'Quickly ground past toward hot reason.', 'misc', 'numbers', 3627, 'Thompson, Mcfarland and Reilly');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5UYBB7', 18, 35, 'whiteboard integrated portals', 'Special trial southern five majority politics yard.', 'books', 'js', 7192, 'Stephens, Davis and Jordan');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6X9Q3TM0S18EFZG7', 13, 28, 'reinvent B2C channels', 'She once dark.', 'images', 'mp3', 6688, 'Anderson LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('VF3A3D', 37, 5, 'optimize leading-edge e-commerce', 'Put development all tax writer.', 'images', 'wav', 2138, 'Duncan-Garcia');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('NIAUET3FH6CU', 1, 27, 'exploit bleeding-edge e-services', 'Training growth would century.', 'documents', 'avi', 3813, 'White, Martin and Brooks');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WSZK32VL95', 6, 47, 'enhance customized e-services', 'Water question board nor the.', 'music', 'pages', 8014, 'Lee Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Z5OJ6ZTHT1O76CHLG9', 24, 20, 'facilitate plug-and-play interfaces', 'Foreign director show entire scientist these season card.', 'music', 'json', 7946, 'Dennis, Nunez and Stewart');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('AJ7OC2KWG', 12, 23, 'aggregate web-enabled networks', 'Rule open several keep continue attack want.', 'tools', 'css', 8368, 'Graham-Ochoa');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2IS59RXMJQH6K', 19, 44, 'empower killer web-readiness', 'Center thing lead too care more ask.', 'documents', 'bmp', 4197, 'Wright, Bowman and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ZCDOKYIXEJ7UHB0WXVT', 20, 31, 'whiteboard integrated applications', 'Certain smile time after result response.', 'code', 'mp3', 3368, 'Tanner-Taylor');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2228EKDSEF', 5, 9, 'matrix next-generation info-mediaries', 'Top kind exist need cost field ask least.', 'games', 'docx', 8550, 'Holloway PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('7Q5BDZTTRD9ESU2G', 17, 16, 'redefine compelling applications', 'Could accept officer when those activity crime billion.', 'music', 'jpeg', 8630, 'Adkins Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('0M2JXDCLZ0', 40, 36, 'iterate frictionless platforms', 'So analysis meeting tell.', 'tools', 'webm', 456, 'Gutierrez PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('X9QBYBID', 17, 1, 'harness best-of-breed deliverables', 'Agree future itself material best foreign.', 'tools', 'gif', 3834, 'Wheeler-Silva');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('SDUC8HE5XIPW5804', 9, 33, 'maximize extensible deliverables', 'Year interest upon hour.', 'games', 'css', 7394, 'Johnson-Robbins');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5K4EC6Y', 15, 37, 'deploy value-added ROI', 'Tv stay order group until.', 'art', 'csv', 8028, 'Payne, Ruiz and Valentine');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('D4PEN3PQOBHRL', 27, 9, 'disintermediate holistic bandwidth', 'Me performance will state.', 'music', 'ods', 1613, 'Castillo-Moran');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CNB4GX0R2UPU', 37, 25, 'revolutionize interactive schemas', 'Reflect particularly space few need theory church.', 'code', 'mp3', 1279, 'Thomas Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('KQSJZL6L31I5BAKXS', 28, 31, 'aggregate transparent content', 'Best civil together music pay yet claim on.', 'tools', 'csv', 9887, 'Callahan, Neal and Garcia');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('PDC44U9YAF75YQQJG', 1, 18, 'transform best-of-breed action-items', 'Increase reality turn.', 'tools', 'jpg', 7548, 'Case and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5YJUXY2VSUV5XI5G3DIZ', 16, 51, 'syndicate value-added systems', 'Seem establish use though.', 'books', 'odt', 9869, 'Humphrey-Anderson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('PWJQE', 42, 6, 'optimize front-end communities', 'Support attention it Republican whether.', 'documents', 'tiff', 1369, 'Tanner-Taylor');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XHYK1', 17, 42, 'synthesize revolutionary bandwidth', 'Water alone old who.', 'code', 'png', 9976, 'Wallace-Hernandez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('I0K5BF0XOU8RRWJS', 46, 45, 'e-enable frictionless niches', 'Which compare charge.', 'documents', 'mp3', 8496, 'Lee Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('P9K4TFHA36EYQVU', 5, 13, 'brand dynamic e-markets', 'His citizen about several.', 'tools', 'tiff', 7680, 'Maynard-Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('R3HEM3T897D8B', 31, 5, 're-intermediate dot-com niches', 'Simple her every against subject.', 'books', 'key', 5896, 'Lowe, Pacheco and Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('PH7NZ3', 32, 19, 'productize B2B e-services', 'Pick environmental history figure service sea successful.', 'games', 'ppt', 8385, 'Patel PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('B5B2RB', 8, 42, 'revolutionize synergistic markets', 'Good account yet hard summer front.', 'art', 'mov', 3063, 'Contreras, Lynch and Foster');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('7FN4G7FYOI18A2AQVD', 26, 27, 'transform robust deliverables', 'Fall common site yeah add.', 'code', 'jpeg', 4695, 'Washington-Gonzalez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BVTXD071JBIUY', 46, 33, 'matrix back-end portals', 'Scientist notice back product.', 'code', 'avi', 8865, 'Jones-Ortiz');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('8JVZWM0IHY17XX', 2, 49, 'integrate dot-com convergence', 'Compare beautiful to born.', 'art', 'tiff', 771, 'Kemp-Hodges');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('D4U6ZK8KO3U9N', 19, 6, 'transform 24/365 communities', 'This tree including view money task.', 'books', 'html', 9154, 'Anderson LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BW30ULX2XGPUPLP', 15, 45, 'drive seamless channels', 'Tell stand again.', 'books', 'css', 6127, 'Dunn, Bowman and Simmons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WK8M1SJJ5IRDHDS', 3, 4, 'scale global portals', 'Trade health data threat leg eight animal.', 'misc', 'mp4', 4545, 'Norman-Rivera');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2SW2XT1PPYX', 9, 41, 'leverage sticky methodologies', 'Officer public meet right prove.', 'images', 'jpeg', 6247, 'Cook PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('DX04DLJ1O', 41, 46, 'leverage user-centric applications', 'By once hope sure.', 'music', 'wav', 5477, 'Arnold LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('I0OJ9748', 41, 48, 'transition proactive web services', 'Cover voice if see.', 'images', 'mp3', 3748, 'Thomas, Parker and Wright');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ETUSGK66QD61ZH3WOP8R', 30, 36, 'seize web-enabled niches', 'Night authority spring role maybe commercial west draw.', 'documents', 'jpg', 5629, 'Williams PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XK54KCGLQF9VX01VVB40', 47, 5, 'scale sticky users', 'Three American party your cause.', 'documents', 'mp4', 6712, 'Wallace Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('DTJ3FON8UE3D95N4INSF', 48, 34, 'grow real-time technologies', 'Fast world day special another executive.', 'tools', 'flac', 3079, 'Adams-Taylor');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('KD57F', 32, 44, 'cultivate sticky deliverables', 'Else gun step western human appear.', 'music', 'webm', 9440, 'Stephens Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3OPK3DH4ZI73RO', 50, 20, 'implement out-of-the-box mindshare', 'Sign possible type its much investment.', 'documents', 'csv', 4603, 'Johnson-Robbins');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WQHR6DBMU6W3IJGNIEXF', 34, 5, 'brand rich info-mediaries', 'Whether vote region.', 'tools', 'csv', 1151, 'Carrillo-Wilson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Z0XA0YOXAY6UO10', 27, 16, 'utilize synergistic web services', 'Peace bill say rather bank parent.', 'tools', 'png', 7114, 'Wright, Bowman and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('30OR6SWDE690', 9, 17, 'envisioneer best-of-breed web services', 'How sit lot behavior executive image policy who.', 'misc', 'js', 5006, 'Lewis, Hernandez and Snow');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XTYF9MP6T4E8C3P2R2VJ', 49, 3, 'streamline front-end e-services', 'Rather prevent fine improve sea oil later.', 'documents', 'css', 6153, 'Garcia-Reed');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('HQRQELWCEHW', 15, 27, 'visualize visionary bandwidth', 'Finish state all.', 'misc', 'txt', 9383, 'Cooke, Robbins and Murray');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('L14HL58UR82FUOI629TZJ', 30, 27, 'harness frictionless e-markets', 'Sometimes life significant chair more work cold.', 'books', 'gif', 7877, 'Lewis-Decker');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('GU6848TQ4VA5R', 46, 45, 'monetize granular synergies', 'Professor cover peace fish.', 'images', 'bmp', 113, 'Franco Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Z0ETQEE80W6', 23, 45, 'harness collaborative e-markets', 'Agency under difficult million.', 'images', 'txt', 8267, 'Lewis Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('FQXWTL', 38, 7, 'morph virtual communities', 'Role office radio.', 'music', 'mov', 4774, 'Smith Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('JJNV2CO48TXANYNFBKDI2', 23, 14, 'orchestrate visionary schemas', 'Until suggest quickly ball.', 'music', 'wav', 76, 'Garcia-Reed');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('TZYP10H0544', 36, 35, 'engage killer solutions', 'Small respond carry good first information.', 'tools', 'mp4', 2792, 'Jackson Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3X7PR3QB8KHLPUC2Z', 38, 36, 'engineer B2B niches', 'Somebody bit firm develop water down eye.', 'music', 'mp3', 9568, 'Adams-Taylor');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('92RNQOWISW5Y9', 44, 1, 'grow B2B users', 'Better low rock lot wall five sister.', 'games', 'png', 229, 'Cooke, Robbins and Murray');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('7SPGQCTJ83R7DVZD', 3, 15, 'redefine plug-and-play infrastructures', 'Evening the Mrs church.', 'tools', 'odp', 5593, 'Gutierrez PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('EQ8GW', 49, 20, 'exploit customized platforms', 'Rather address serve truth until.', 'tools', 'flac', 6349, 'Carrillo-Wilson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WE1Q5UY', 39, 36, 'target synergistic technologies', 'House thank truth sea product.', 'code', 'webm', 8059, 'Lewis LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6ZPFBD41AGJG629ELF', 23, 11, 'synergize granular functionalities', 'Probably father guess race news the.', 'tools', 'html', 2285, 'Woodward-Miller');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Z485XQ48L6M', 24, 44, 'repurpose enterprise relationships', 'Whose later lose sign hotel candidate order series.', 'code', 'xlsx', 6907, 'White PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('JU7F89YBYG0OZOFS', 25, 30, 'streamline one-to-one functionalities', 'Simply certainly stop avoid speech past safe.', 'documents', 'txt', 4571, 'Lewis, Hernandez and Snow');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('67FYTY9BLZIR', 50, 22, 'expedite end-to-end e-markets', 'Example ask industry start billion.', 'images', 'doc', 3651, 'Kelly, Smith and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Y2Y239JDBZL66K3', 10, 34, 'disintermediate customized deliverables', 'Might business practice poor bill country.', 'tools', 'js', 7111, 'Williams PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('T43XM4QIZMCXKVUXFLYB', 25, 40, 're-contextualize e-business channels', 'Skin who data mouth.', 'books', 'wav', 33, 'Torres-Morrow');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WA2I45YB7E6DG', 33, 27, 'enhance granular content', 'Soon Democrat food at.', 'misc', 'pages', 5131, 'Wallace-Hernandez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('D8TJJICNEOV82', 9, 18, 'whiteboard mission-critical vortals', 'Could national must blue.', 'art', 'tiff', 2168, 'Wheeler-Silva');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MJZ47QMOV', 43, 8, 'maximize impactful models', 'Mother oil carry ever certain laugh standard.', 'code', 'ods', 917, 'Neal Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('M70ZQD6N2FJQ1OJA', 31, 28, 'utilize robust communities', 'Against fill southern road.', 'art', 'bmp', 3972, 'Gomez, Gonzalez and Johnson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('W7SM1', 18, 5, 'reinvent strategic users', 'Prove bed Congress action.', 'misc', 'gif', 4577, 'Cooke, Robbins and Murray');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6WMZLW55AV0D86', 23, 43, 'enhance visionary metrics', 'Community race audience material section.', 'books', 'avi', 5123, 'Schroeder-Williams');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MBEUPWPIHGRS4FJVF93QF', 5, 24, 'reinvent clicks-and-mortar functionalities', 'Within data break center.', 'art', 'doc', 1001, 'Nelson Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('04GWNLKR', 19, 47, 'drive scalable synergies', 'Hold throw two may turn.', 'images', 'wav', 9895, 'Schroeder-Williams');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5QQQHCZ', 38, 20, 'embrace enterprise users', 'Treat work treatment.', 'code', 'csv', 7582, 'Williams PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('V2U95QBAM', 45, 37, 'orchestrate e-business vortals', 'Response hospital reveal.', 'code', 'jpeg', 8336, 'Humphrey-Anderson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('JVDOL8R', 18, 8, 'mesh real-time markets', 'Much top letter leave.', 'music', 'tiff', 1953, 'Wallace Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('4BQVNNGVBJ7GK5W121', 10, 34, 'integrate intuitive schemas', 'Have these particular order mission girl.', 'images', 'csv', 443, 'Fields PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('7ZNIARN4KATYPLOR', 22, 4, 'implement vertical technologies', 'Return fight cut dog sister.', 'tools', 'flac', 6982, 'Scott, Duncan and Palmer');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('L1XOEG68Y1O9P', 4, 29, 'iterate rich e-tailers', 'Head garden manage down audience discussion eat listen.', 'music', 'mp3', 9299, 'Mcbride-Martin');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('VF0W3NHMB0IO6T627B', 26, 18, 'whiteboard collaborative markets', 'Season rather increase book happy.', 'books', 'mp3', 8030, 'Tyler-Mitchell');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3BVQ0WX4BBQRYZ0K3O0R', 20, 14, 'e-enable clicks-and-mortar systems', 'Stop happy herself measure benefit direction police.', 'art', 'docx', 195, 'Wise-Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('RK0HL3Z5I7CG6Z9SNV8', 40, 51, 'deliver turn-key networks', 'Buy avoid summer.', 'images', 'css', 2980, 'Stevenson-Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('D5X3JMCXX', 44, 38, 'target out-of-the-box e-tailers', 'Could personal sport they the.', 'documents', 'flac', 2067, 'Bryant, Burton and Rojas');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5X84IINRW', 39, 17, 'e-enable end-to-end models', 'Both century option myself drop.', 'books', 'pages', 9601, 'Cantu-Carrillo');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('M20NJW31JND', 42, 23, 'matrix integrated eyeballs', 'Magazine show table without use perhaps.', 'misc', 'webm', 9353, 'Wallace-Hernandez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('T5TJZ3PWAKO1O3XF', 31, 27, 'orchestrate 24/7 e-tailers', 'Certainly together bit according.', 'games', 'css', 8452, 'Ford PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('FIIVD9380IDSKURUJ', 1, 51, 'enable mission-critical solutions', 'Say outside long particular.', 'books', 'numbers', 4478, 'Salazar, Hughes and Moreno');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5FKZ5E1M87QESJ30Q', 5, 45, 'innovate granular portals', 'Wait them life approach.', 'misc', 'flac', 1023, 'Daugherty Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('JRQQAAGBDRKLHTRGH7', 7, 5, 'expedite bricks-and-clicks deliverables', 'Lot professional production old group husband.', 'code', 'numbers', 3500, 'Vance and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3TGKD7HO9EKV69R0UIP', 40, 39, 'extend proactive metrics', 'Movement situation my church establish.', 'books', 'pptx', 7951, 'Haney Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('27MCUEOD4FUNSK', 13, 37, 'architect end-to-end web services', 'Part main truth parent suffer.', 'books', 'wav', 2605, 'Spencer, Brown and Murray');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('HFO63EMAFK5M4V0PD5V8', 1, 15, 're-intermediate compelling web-readiness', 'Middle audience southern week last try.', 'games', 'mp3', 2936, 'Duncan-Garcia');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ILQNSNAUOE8', 36, 3, 'orchestrate customized web-readiness', 'Challenge around half very.', 'music', 'jpg', 5527, 'Duran, Perez and Adkins');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('LFZV37F28', 22, 6, 're-contextualize ubiquitous e-commerce', 'Set only office half hard need all produce.', 'games', 'html', 9954, 'Hood-Jones');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('VI9T9PFU02Y4M3P3PUUPE', 19, 48, 'extend leading-edge technologies', 'During success side serve call.', 'art', 'odp', 3499, 'Carrillo-Wilson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Z00K1Q', 10, 13, 'expedite rich vortals', 'Quality charge feeling people tree.', 'misc', 'mp4', 3869, 'Gilbert, Bennett and Gutierrez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('IHKERZ4HCFSBT', 42, 17, 'visualize cross-platform action-items', 'Second difference quickly bag morning.', 'code', 'mp4', 3715, 'Koch-Porter');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5PQJ744', 40, 41, 'synthesize virtual architectures', 'New fine can if.', 'tools', 'js', 6915, 'Lee Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('1OV0H27YQSDB4', 19, 51, 'exploit vertical web-readiness', 'Hair such seek lot build.', 'documents', 'bmp', 4465, 'White PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('N1UTCLLRD5VJWEHDWBN6', 12, 34, 'orchestrate back-end applications', 'Room under we say.', 'code', 'css', 4388, 'Jones-Duncan');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BUE03EPCMK5CN5W86K7', 4, 25, 'mesh efficient schemas', 'Head carry of ago find.', 'documents', 'gif', 904, 'Cooke, Robbins and Murray');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('0MWSLI7P1QKZZ4', 17, 2, 'repurpose compelling eyeballs', 'System board environment task near trouble.', 'music', 'txt', 1558, 'Stanton and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('IRJVC7CDJH2UTY011', 3, 50, 'cultivate value-added action-items', 'Foreign method fill more beat.', 'music', 'wav', 6197, 'Peterson-Brown');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MKO9QET3HY7P', 21, 48, 'visualize back-end partnerships', 'Reduce exactly particular later city allow staff.', 'music', 'bmp', 3674, 'Norman-Rivera');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XLVYCBFBC03JVAQG', 17, 31, 'empower leading-edge paradigms', 'Surface rich city total send dark bring.', 'music', 'jpeg', 522, 'Gonzalez, Green and Lowe');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('L49FNMBCD33DD', 30, 17, 'scale value-added eyeballs', 'Player small official subject agency improve despite.', 'games', 'pdf', 6710, 'Lee, Hunter and Ford');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('21UGUUBNP1', 27, 40, 'transition strategic portals', 'Challenge wife fish coach west religious trip.', 'music', 'css', 100, 'Herrera, Park and Gallegos');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CUQUP009JQLD4ZRBZS', 26, 47, 'syndicate B2C architectures', 'Shoulder machine group kind not west name.', 'books', 'html', 3125, 'Higgins Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('X6W6X5GILAJ2', 44, 27, 'visualize real-time info-mediaries', 'Magazine war interest rock wish seek pull.', 'games', 'mp4', 2469, 'Marks Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('C2X22WDYBYOD8A1H8X9XC', 27, 42, 'aggregate leading-edge deliverables', 'Thought create cell up own.', 'books', 'mov', 4754, 'Wells-Jackson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2FMUFGLRHDZUFPYQ', 8, 39, 'repurpose enterprise paradigms', 'Because chair of happy.', 'code', 'webm', 6629, 'Martin PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('97QPRUTYL', 14, 5, 'enable e-business action-items', 'Tell off live sit truth.', 'tools', 'ods', 7102, 'Frey Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CM3XLMHENI7S8UOPK', 34, 18, 'maximize granular metrics', 'Energy reveal like agree training.', 'misc', 'gif', 3778, 'Williams Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('32PP76ZK5LEPO1WG09Z', 36, 25, 'exploit front-end users', 'Fear Congress week student those.', 'books', 'wav', 3919, 'Holloway Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('1S7WS7PKONTWYWX4', 25, 21, 'disintermediate intuitive web-readiness', 'Deal woman unit happy.', 'images', 'mp3', 2268, 'Hopkins, Castillo and Winters');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('O8KRDW60J3K0XRHDT6XDT', 19, 29, 'drive rich e-commerce', 'Nearly avoid somebody.', 'misc', 'json', 9370, 'Smith Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('LN0AZUKE0A1TMT3GJ59', 1, 42, 'incentivize front-end eyeballs', 'Late guy star side.', 'games', 'flac', 9188, 'Flores-Andrews');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('77ATEV', 45, 37, 'integrate leading-edge synergies', 'Old similar forward physical.', 'images', 'png', 4274, 'Lewis-Decker');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MVO34C', 7, 50, 'implement vertical relationships', 'Near soldier light star also southern tough option.', 'art', 'txt', 8888, 'Ray Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Y88JFXE7I41E', 10, 7, 'envisioneer 24/7 supply-chains', 'Administration buy paper assume but organization plan.', 'images', 'txt', 9594, 'Patel PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UUSH3D8PB8YBW6Z', 44, 44, 'brand wireless communities', 'Air contain everyone shoulder pass prevent analysis.', 'art', 'webm', 9242, 'Mitchell, Vang and Little');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2ITL25BIV7E2VW2THO', 37, 39, 'enable collaborative schemas', 'Safe pressure simply nearly check who.', 'games', 'flac', 1338, 'Barron, Adams and Reilly');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6Q3GO4LPZG2E8LZQ7DUXY', 40, 35, 'unleash proactive deliverables', 'Offer western fast their amount cost we.', 'tools', 'webm', 7808, 'Villegas-Ramsey');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('FZ56D1Q7Q', 7, 3, 'innovate 24/365 relationships', 'Walk it yes spring.', 'misc', 'avi', 2448, 'Norman-Rivera');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Y2Y4H', 33, 33, 'expedite holistic niches', 'Hand card food bit significant floor.', 'games', 'csv', 9856, 'Case and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('C4XWVFZ', 50, 19, 'facilitate customized experiences', 'Floor hundred past local.', 'books', 'avi', 875, 'Bryant, Burton and Rojas');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('N6S5S0', 8, 10, 'cultivate robust partnerships', 'Attention decide hard fear pull camera.', 'images', 'mp4', 6356, 'Ross PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('AGCYAE21BNK19H', 2, 33, 'harness seamless networks', 'What between court boy degree throughout once.', 'code', 'png', 861, 'Gomez, Gonzalez and Johnson');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6V4B2UHOK5ZM1OWYE8MV', 44, 16, 'seize real-time convergence', 'Guy crime region fast.', 'art', 'txt', 1424, 'Miller, Webb and Rice');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('N1CTQN1AEDWM04Q00', 42, 1, 'benchmark end-to-end vortals', 'Hard type process report.', 'images', 'jpeg', 829, 'Cannon-Jones');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('KHS02Q99V', 33, 51, 'engage extensible infrastructures', 'Begin happy fill build.', 'art', 'odp', 7845, 'Velazquez-Contreras');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WI6YVYO', 25, 41, 'embrace world-class experiences', 'East gas past time key popular.', 'documents', 'flac', 8334, 'Williams, Sandoval and Chaney');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('86WVI35UB8ONK4BG92', 25, 41, 'synthesize seamless methodologies', 'Personal camera agency.', 'tools', 'mov', 8859, 'Simon Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('PINOPOLHDJHEK', 40, 35, 'grow extensible synergies', 'Space accept term deal must song.', 'music', 'csv', 1086, 'Barnes, Gallagher and Black');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CYMMQQMYEWRO6CB5XS9P', 47, 32, 'morph best-of-breed solutions', 'Example second new foot both success argue.', 'code', 'jpeg', 805, 'Anderson LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BYPLGOFPQMJT', 33, 28, 'optimize sticky architectures', 'Detail she social nor instead answer.', 'music', 'mp3', 667, 'Thompson, Mcfarland and Reilly');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('4ASMEMPZMUTTPV', 13, 38, 'seize next-generation schemas', 'Mention house continue if.', 'code', 'mp4', 5588, 'Stephens Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UEN7FUN', 39, 36, 'reinvent leading-edge vortals', 'Team church course identify put.', 'documents', 'txt', 5889, 'Graham-Ochoa');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('949BZO', 42, 38, 'synergize dot-com networks', 'Person Mr offer among speech relate quality.', 'code', 'mov', 7679, 'Jones-Ortiz');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('YUJ72682YR6XBDTDSKH', 25, 13, 'evolve clicks-and-mortar synergies', 'Already continue resource enough able somebody.', 'code', 'odp', 4040, 'Shaw-Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('EIJ6PEH88HT81OTQ1', 17, 2, 'innovate proactive functionalities', 'Place big worry per natural.', 'misc', 'wav', 4707, 'Simon Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WUUPSVKB6AIT9P8FWBLB2', 49, 31, 'productize one-to-one communities', 'Onto build body between break up nothing decision.', 'images', 'gif', 1704, 'Kelly, Henry and Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3HHJP2PO2PP', 42, 40, 'aggregate intuitive solutions', 'Door impact hand I window whatever.', 'games', 'odp', 3872, 'Wallace Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5IBBA7O5O7HU08J', 13, 3, 'matrix clicks-and-mortar e-business', 'Article maybe agency third easy.', 'misc', 'bmp', 1951, 'Daugherty Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('L8R0R2CPTTN2Z0SQ55BV', 8, 45, 'reinvent synergistic markets', 'Somebody conference relate civil government find day.', 'tools', 'odp', 364, 'Wright, Wright and Waller');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('EY9BOWO0ONREKII9SYIQG', 44, 19, 'drive cross-media models', 'Citizen well south while carry.', 'games', 'png', 4946, 'Hernandez, Stark and Garrett');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MJJSR96LPHTNMZHIR8REL', 29, 3, 'orchestrate world-class solutions', 'Care total pattern or way.', 'tools', 'odt', 3542, 'Wright, Bowman and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('1AHOY', 24, 6, 'grow integrated experiences', 'Small mind security sure door spend.', 'documents', 'txt', 3438, 'Jackson Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('8XJNZJMFJI937JIU064', 14, 29, 'redefine B2B e-tailers', 'Guy small ok age line note.', 'documents', 'gif', 3464, 'Smith Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3V23HB1NVU3YG8XT3A', 41, 27, 'deliver vertical supply-chains', 'Kind skill individual.', 'tools', 'tiff', 9572, 'Brown-Norton');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('5YXOUQ', 35, 37, 'synthesize cutting-edge convergence', 'Stand own PM especially condition.', 'books', 'mov', 2367, 'Hester-Blackburn');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BDAAVO', 3, 49, 'synergize B2C communities', 'I arm commercial picture group.', 'misc', 'csv', 3321, 'Short LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('EUEXHHLN3DBDUWM7', 39, 14, 'expedite ubiquitous content', 'End build different happy surface watch now.', 'code', 'avi', 5628, 'Patel PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('23CWHYK', 40, 44, 'optimize leading-edge users', 'Tree discover bar need position strong admit eye.', 'images', 'odt', 9358, 'Yoder Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('8GIVGTLBQM6Z7J2D4GEK', 39, 23, 'cultivate impactful e-markets', 'Wind he name deep air firm single.', 'games', 'docx', 7037, 'Wallace-Hernandez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6MA0OT1J2', 11, 6, 'transform next-generation relationships', 'Feeling there name purpose none toward.', 'art', 'jpg', 892, 'Short LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('66S4EM2P', 6, 40, 'enhance customized content', 'Beat myself wife note within.', 'documents', 'json', 7834, 'Wells-Morales');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('KRTZOJ6JKK3X7ZM', 39, 2, 'embrace e-business experiences', 'Mission drive skin fire difference perform yeah.', 'games', 'webm', 9240, 'Allison-Rodriguez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('C3FREM', 32, 14, 'enhance turn-key ROI', 'Rest force western voice meet.', 'games', 'xls', 8206, 'Meza, Hines and Bailey');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XAT20KDG7EMM7', 18, 33, 'implement enterprise info-mediaries', 'Laugh current seek director possible fact sense.', 'books', 'wav', 2035, 'Kemp-Hodges');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('HUFMZDU8S', 43, 28, 'deliver extensible schemas', 'Stop difficult eat.', 'games', 'png', 6865, 'Holmes PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('1JXH31GX8HUYX0IE83', 15, 32, 'implement efficient partnerships', 'Central send catch population participant radio door lay.', 'misc', 'avi', 6678, 'Mcbride-Martin');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('VMHJQ7O5VWP92VZB2Z', 14, 9, 'enhance impactful e-business', 'Note benefit seven full light.', 'images', 'mp3', 5924, 'Hines-Miller');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('J5C70PD4F9807NC5', 3, 19, 'unleash cutting-edge relationships', 'Hot response seven him body.', 'misc', 'jpeg', 1528, 'Davis, Bentley and Clark');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('020UJRJD', 6, 4, 'syndicate enterprise portals', 'Same culture green growth nation change.', 'music', 'mp4', 4220, 'Tyler-Mitchell');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('YXRFHRLQ', 50, 5, 'orchestrate mission-critical web services', 'Skill stand office others significant near identify.', 'books', 'json', 5863, 'Garcia-Reed');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('A2EPH58ZDGO7J', 28, 40, 'synergize transparent functionalities', 'Level clear treatment sing.', 'tools', 'wav', 680, 'Ramos LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2KEDWE', 48, 19, 'facilitate plug-and-play relationships', 'Enjoy relationship mean score few medical.', 'documents', 'wav', 8278, 'Mckay Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('7UGDOWFW37N7HBK', 20, 28, 'harness dot-com deliverables', 'Place training bring a.', 'code', 'mp4', 7810, 'Rodriguez Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CBMBFZFMGFQQ', 19, 13, 'e-enable bricks-and-clicks schemas', 'Agency account military send partner.', 'books', 'mp4', 3966, 'Mcdowell LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('FNJP0CUCSX2G282D26L58', 50, 6, 'embrace efficient ROI', 'That development size finally.', 'books', 'html', 3474, 'Tanner-Taylor');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('9LNGWY5DWNPA51K2', 43, 38, 'optimize interactive e-markets', 'Total drug service central long suffer product.', 'misc', 'mov', 9474, 'Garcia Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('4FQOB', 37, 1, 'utilize leading-edge markets', 'Six leader care else.', 'music', 'bmp', 127, 'Baldwin-Figueroa');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('JWOG2WE8', 7, 36, 'repurpose out-of-the-box relationships', 'Word court finish feel size sign.', 'music', 'bmp', 4819, 'Johnson Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('TNQ84HUOAXE', 47, 14, 'revolutionize front-end paradigms', 'Debate seem everyone maintain.', 'music', 'mp3', 3821, 'Patton Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2C67F990PDFNMH2KND', 41, 42, 'productize bricks-and-clicks markets', 'Across reveal suggest marriage increase difference.', 'music', 'pptx', 942, 'Hernandez Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('FYRZH2Y0AJ', 45, 20, 'drive web-enabled paradigms', 'Boy require turn prepare.', 'books', 'doc', 3339, 'Lewis Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('DITF47NV9AH76', 30, 42, 'transform turn-key architectures', 'Crime safe interview evening wish institution paper.', 'music', 'html', 1963, 'Joyce PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UYZQMXQED8H2TW', 42, 45, 'redefine turn-key interfaces', 'Picture event weight success about such scene.', 'images', 'mp3', 7469, 'Hester-Blackburn');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('LU89A', 33, 50, 'morph compelling technologies', 'Side exist travel least.', 'code', 'tiff', 7643, 'Case and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('7YNBEF', 32, 13, 'optimize wireless communities', 'Truth well opportunity more expect bank.', 'tools', 'tiff', 7685, 'Kelly, Smith and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('TJIU0S', 10, 15, 'engineer B2C action-items', 'Public perhaps image relate.', 'art', 'bmp', 7424, 'Hall Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2GOYYZDWAU2NWJXLT', 31, 7, 'transform mission-critical web services', 'Avoid start each factor benefit mission.', 'tools', 'ppt', 1256, 'Wells-Perkins');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XPCN0F1R4', 2, 26, 'utilize virtual eyeballs', 'Look floor notice behind must edge wonder first.', 'code', 'wav', 9767, 'Rodriguez Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('R0UDL5T0Q', 28, 33, 'extend value-added interfaces', 'Look candidate foreign grow cup choose.', 'images', 'wav', 9597, 'Duncan-Garcia');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('7L9KY', 44, 11, 'target e-business ROI', 'Close certain wait PM girl consumer.', 'music', 'gif', 5533, 'Spencer, Brown and Murray');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('RI5SPSRSS1R29UB', 4, 49, 'target revolutionary users', 'New walk mention fire.', 'games', 'css', 8437, 'Mcbride-Martin');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('699OPJEQ5B20HL07', 15, 10, 'e-enable B2B applications', 'Series view ability body give growth.', 'books', 'txt', 6478, 'Fritz-Lee');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MCD0BZ68ZBOUZ8', 1, 48, 'benchmark interactive portals', 'Drop country wall price individual.', 'games', 'js', 1477, 'Hernandez Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('8HBG25ODWXJT9ECAHI', 45, 28, 'transform revolutionary content', 'Level land cell air image say everything.', 'misc', 'html', 8250, 'Owens Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CDQIS', 39, 13, 're-contextualize intuitive interfaces', 'Turn few professor population service.', 'code', 'png', 4736, 'Vasquez and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('AXF6A09GKL6POJ', 36, 4, 'scale virtual synergies', 'Agreement increase building miss get into kind.', 'books', 'js', 8493, 'Lewis-Decker');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('45E2D7MV4MJN0', 8, 6, 'innovate viral models', 'Value type win meet of soldier adult.', 'art', 'mov', 2627, 'Maynard-Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UPT1C', 36, 12, 'engineer proactive web-readiness', 'Apply raise him sense these evening.', 'misc', 'wav', 7124, 'Bryant, Burton and Rojas');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('FCU04Y3TF63OILE5RSL3', 16, 44, 'expedite rich action-items', 'Choice behind economic thank fine see nothing.', 'misc', 'flac', 6628, 'Gross Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('XTKKXBLZZBX93GS', 30, 23, 'syndicate extensible e-tailers', 'Require born despite spring rule most second.', 'documents', 'webm', 3224, 'Gallegos Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('PEVLRHGO05S1XOQFS6', 33, 26, 'disintermediate integrated web-readiness', 'Practice agreement those exist account stage.', 'tools', 'json', 7774, 'Duncan-Garcia');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('OWP3D0V', 13, 41, 'generate vertical experiences', 'During case director energy central inside.', 'documents', 'json', 2338, 'Bryant, Burton and Rojas');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('B6L7BDOA', 34, 30, 'revolutionize revolutionary vortals', 'Local magazine daughter rise instead city professor.', 'books', 'xlsx', 2283, 'Kelly, Smith and Wells');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2Z9615JLE2UIDCM7OD', 49, 33, 'architect holistic networks', 'Around hair ground international box foot.', 'images', 'odt', 7396, 'Schroeder-Williams');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('SJZRNHN', 12, 42, 'engage end-to-end mindshare', 'Generation shoulder window military keep.', 'code', 'js', 2151, 'Schroeder-Williams');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ASTLCU', 42, 49, 'expedite revolutionary supply-chains', 'Heart wife social training.', 'art', 'mp3', 4142, 'Day, Mendez and Bradley');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('AJ92P9GU71', 7, 23, 'evolve distributed methodologies', 'Suddenly although message.', 'misc', 'flac', 192, 'Pearson, Griffin and Kerr');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('02C91G77F9S3T', 45, 4, 'monetize distributed schemas', 'Grow again wonder section seek watch admit.', 'documents', 'odp', 3164, 'Thompson, Mcfarland and Reilly');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WPF946Y2FHYCJCVBZ5DS', 25, 36, 'disintermediate back-end e-markets', 'Everyone name past color check.', 'art', 'numbers', 7551, 'Mitchell, Vang and Little');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MHBKQ5MZ0SH36X', 40, 1, 'productize B2C bandwidth', 'Artist by task serve either.', 'art', 'avi', 764, 'Fields PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ZD2CRTD', 8, 2, 'innovate real-time deliverables', 'What produce occur campaign like.', 'music', 'js', 9074, 'Higgins Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BHOXCIQ5EP4DJ34JF6', 5, 51, 'synthesize vertical technologies', 'Move under physical probably.', 'images', 'pages', 9984, 'Williams LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('13URU71I0ET52TX', 28, 21, 'streamline 24/7 channels', 'Scientist weight history level action wife nearly.', 'art', 'csv', 6505, 'Lewis Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('H8JDI', 29, 5, 'exploit collaborative e-services', 'Offer song walk contain worker.', 'images', 'tiff', 7938, 'Joyce PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('85JV1UMUHD0L52HHVV', 36, 43, 'transition collaborative web services', 'Growth rate draw space prove mouth place.', 'art', 'webm', 2556, 'Bates, Foster and Hart');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Y3F7W49Z', 30, 10, 'monetize granular architectures', 'Mean prevent watch receive would consider.', 'code', 'jpg', 1671, 'Lewis, Hernandez and Snow');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('TS0AU', 2, 10, 'seize front-end applications', 'Ground recently threat forget.', 'misc', 'jpg', 475, 'Crosby-Black');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('KU21KBD7E', 39, 21, 'leverage value-added architectures', 'President least land style music.', 'books', 'mov', 5597, 'Castillo-Moran');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('IKPREAG', 39, 51, 'incentivize turn-key schemas', 'Industry above drive seven risk affect.', 'images', 'mp4', 9038, 'Flores-Andrews');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('DA9GT25X739M1Y0', 38, 10, 'harness leading-edge info-mediaries', 'Mind a story front itself on employee right.', 'documents', 'html', 4177, 'Crosby-Black');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MV6XK', 13, 31, 'incentivize cross-platform e-tailers', 'During check city plant nor story.', 'music', 'xlsx', 443, 'Ramos LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3XFYKT1MPFV4KS9AT900', 17, 45, 'productize revolutionary e-commerce', 'Line turn pull you always.', 'games', 'gif', 4833, 'Gilbert, Bennett and Gutierrez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('IP6EQZ7C4XWJFW4CF6', 43, 27, 'matrix web-enabled synergies', 'Situation sing person draw five Democrat bag.', 'art', 'mov', 3976, 'Fields PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UQ0M7JMGK', 44, 9, 'whiteboard extensible action-items', 'Put wall eight term until.', 'documents', 'tiff', 2322, 'Ray Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Q7YGYZ0S40T', 6, 29, 'redefine clicks-and-mortar technologies', 'Fish coach newspaper turn fish hard nature southern.', 'code', 'gif', 7585, 'Day, Mendez and Bradley');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('288Y1JHE2K', 48, 22, 'revolutionize granular e-business', 'Friend trial main back.', 'misc', 'flac', 42, 'Salazar, Morris and Carpenter');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('GS0MI64', 21, 37, 'leverage holistic e-services', 'Yourself budget provide nearly short side.', 'images', 'avi', 964, 'Williams LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('WA25GWM', 36, 44, 'synergize next-generation e-services', 'President discuss agreement develop determine.', 'images', 'gif', 707, 'Wells-Morales');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('PLUBPMU7S9ZQ', 31, 50, 'matrix innovative infrastructures', 'Never set system their quickly my.', 'art', 'html', 6742, 'Arnold, Rivera and Moyer');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ZQA56', 35, 31, 'orchestrate ubiquitous interfaces', 'People effect number strong treat.', 'tools', 'mp3', 3266, 'Torres-Morrow');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('4Y6Z9X12', 26, 19, 'seize B2C bandwidth', 'Why right color letter.', 'misc', 'odt', 4040, 'Garcia Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('RGSP8Y', 39, 38, 'utilize killer synergies', 'Suffer company his executive.', 'music', 'mp3', 4086, 'Williams, Davis and Powell');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('O17E3BH6NFU', 39, 5, 'generate magnetic content', 'Feeling officer suggest image.', 'art', 'json', 7360, 'Barron, Adams and Reilly');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('KZ9U1E2JUS9SMJ6TQ8K', 9, 25, 'orchestrate viral synergies', 'Report film level popular.', 'music', 'avi', 1389, 'Shaw-Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('LYBLSUB7S10666J6VJOCJ', 31, 4, 'strategize cutting-edge web-readiness', 'Kid real work successful possible room.', 'images', 'avi', 1853, 'Anderson LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('AQ2LR5R14I', 27, 43, 'maximize extensible e-services', 'Capital hold control.', 'misc', 'ppt', 6869, 'Miller, Webb and Rice');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('SCH5S98F9C9FLIBD1QX4', 35, 8, 'e-enable synergistic applications', 'With of street standard girl deal ahead.', 'tools', 'png', 7063, 'Byrd, Gonzalez and Duncan');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('IL3GL4T', 23, 44, 'transform value-added communities', 'More along real group might religious recent.', 'images', 'gif', 654, 'Barnes, Gallagher and Black');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('981M45J7A6LBAE', 28, 13, 'deliver one-to-one e-services', 'Tv information discuss pressure discover.', 'games', 'html', 6633, 'Hopkins, Castillo and Winters');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6LSVLO3ERNTRZJHG0G', 11, 29, 'exploit extensible web-readiness', 'Dark explain open majority send hair appear.', 'music', 'avi', 7629, 'Davis, Bentley and Clark');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('Y2N0RN', 49, 21, 'repurpose cutting-edge relationships', 'Direction natural feeling compare drop.', 'books', 'txt', 4709, 'Washington-Gonzalez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('L3IIEMC1WYM3W1KGXQ9R1', 14, 28, 'innovate end-to-end solutions', 'Note such in day among upon leader sometimes.', 'art', 'tiff', 2883, 'Stephens, Davis and Jordan');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('BH5BATRJWJY', 13, 2, 'empower holistic e-markets', 'Source prepare learn this government cold blue.', 'tools', 'key', 9841, 'Ramsey PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MLERQAU3CZW9Y3C', 22, 5, 'orchestrate efficient mindshare', 'Future either somebody cell mission break take.', 'documents', 'tiff', 620, 'Johnson-Robbins');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('3QM188FD73U', 51, 17, 'facilitate user-centric architectures', 'Buy approach trade man approach create career.', 'misc', 'odt', 1607, 'White PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('KFBBDJ2O', 1, 17, 'aggregate user-centric experiences', 'Economic sense this industry manage we.', 'books', 'webm', 2883, 'Chen-Hawkins');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('B732DEO', 8, 11, 'engage end-to-end relationships', 'The hear view deep check into he.', 'tools', 'txt', 4419, 'Wise-Smith');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('YN2SDTYRD0CIJ72KKJK', 16, 43, 'innovate intuitive ROI', 'Usually price investment note beat just create staff.', 'art', 'gif', 4362, 'Castillo-Moran');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6D6JIDJKU2CCLYW', 7, 41, 'embrace compelling applications', 'Artist paper way.', 'misc', 'wav', 9031, 'Day, Mendez and Bradley');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2MS0C07CGKTC2', 43, 16, 'scale impactful paradigms', 'Maintain leader also star who responsibility.', 'games', 'odp', 571, 'Vance and Sons');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('CIAALP', 44, 50, 'embrace impactful infrastructures', 'Air hit system not against or political.', 'books', 'mp4', 9004, 'Frey Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('41UPBXWORKVV7PPAMXM', 19, 41, 'productize customized models', 'Computer rest professor see.', 'books', 'mp4', 5614, 'Brown-Jones');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('P8YT53FSZ0KG', 35, 19, 'drive rich content', 'Month worker them culture lose above fall.', 'code', 'json', 8829, 'White PLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('GGWXZ', 44, 19, 'benchmark robust content', 'Over one program despite building special.', 'documents', 'png', 8376, 'Bryant, Burton and Rojas');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('FFL7CRM9T1TUNA4A3JK0', 46, 20, 'monetize global action-items', 'Although large able case maybe investment.', 'art', 'csv', 3910, 'Warren-Waters');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('J8TFEGSIMBFKBQHXN', 22, 12, 'monetize strategic networks', 'Job rather provide room join turn.', 'art', 'mp4', 3741, 'Davis, Bentley and Clark');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('6OAUBOFNMM4799S88V', 26, 6, 'unleash 24/365 architectures', 'Design management back.', 'misc', 'js', 1345, 'Thomas, Parker and Wright');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('OVM4J', 5, 40, 'transition world-class info-mediaries', 'Month beat his.', 'books', 'mov', 9282, 'Barron, Adams and Reilly');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('MK852YS1CMM', 9, 51, 'productize viral eyeballs', 'Easy best itself Congress.', 'documents', 'avi', 1214, 'Allison-Rodriguez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('769C58JH910T5GZCLRT', 5, 22, 'incentivize sticky models', 'Somebody dark character north understand wind.', 'tools', 'xlsx', 1566, 'Wilson-Stout');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('NZ8EK6Z7CO', 36, 47, 'synergize clicks-and-mortar networks', 'Model plan husband call you.', 'games', 'flac', 2119, 'Woods-Schwartz');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('HHHDOHAVS0EO2K4RRS04', 12, 37, 'evolve robust e-commerce', 'Word add program major cause believe rise.', 'games', 'png', 6752, 'Gilbert, Bennett and Gutierrez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('9DGZDOJSMHYA', 30, 33, 'benchmark vertical systems', 'Think computer set civil daughter rise toward learn.', 'images', 'xls', 7295, 'Barnes, Gallagher and Black');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('0J7QVKSSD', 8, 25, 'whiteboard turn-key ROI', 'According no particularly fire big.', 'tools', 'mp4', 5861, 'White, Martin and Brooks');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('13QF5RTP', 47, 16, 'monetize granular schemas', 'Condition with hand people.', 'tools', 'mp4', 1796, 'Patton Group');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UA827GA6WFRTQ2', 8, 16, 'facilitate innovative models', 'Him whose conference group end thousand new care.', 'images', 'mp4', 4111, 'Washington, Butler and Espinoza');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UFILA9KZ2QEMYG76', 13, 22, 'deploy cross-media e-commerce', 'Sign her tree audience.', 'art', 'mp3', 2559, 'Velazquez-Contreras');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('0I8XSK1UG5C3X', 24, 14, 're-intermediate impactful solutions', 'Share want yeah with turn.', 'tools', 'css', 3074, 'Haas-Martinez');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('G1UEQBK09', 49, 39, 'grow revolutionary solutions', 'Like between especially nice sister human occur.', 'misc', 'wav', 163, 'Cooke, Robbins and Murray');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2CID2PM88ZLMUDAL', 38, 4, 'implement granular solutions', 'Personal kind trade property include.', 'games', 'tiff', 8105, 'Baldwin-Figueroa');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('9GSJMDS78HQN', 38, 30, 'benchmark efficient paradigms', 'Exactly less according old.', 'books', 'jpeg', 9871, 'Stephens Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('9QH77BNMAK30A6TET3UK', 3, 50, 'scale innovative experiences', 'Win trouble positive.', 'books', 'pptx', 3870, 'Thomas Ltd');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('UCVPPZOYXWYY1IQ', 4, 45, 'drive visionary relationships', 'Fight only animal quality food house attention.', 'images', 'doc', 5834, 'Mitchell, Vang and Little');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('HK06V2AR', 35, 36, 'integrate cross-platform initiatives', 'Indicate newspaper sell do walk performance development should.', 'code', 'mp3', 2259, 'Castillo-Moran');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('SDWAOQL6ECL81FBZGH3Z8', 19, 39, 'synthesize impactful supply-chains', 'Value past last work red nothing first.', 'games', 'mov', 3693, 'Nash, Woodard and Contreras');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('2I43566IFBO', 26, 43, 'architect bricks-and-clicks metrics', 'Color put nice.', 'music', 'tiff', 8960, 'Williams Inc');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('ET1Q87U38A3MJ', 44, 40, 'deliver 24/365 e-markets', 'Foreign everyone address.', 'art', 'png', 4574, 'Ibarra, Green and Flores');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('GFN4N4GWD', 23, 51, 'matrix out-of-the-box technologies', 'Add red TV concern baby ability pressure.', 'documents', 'tiff', 75, 'Black LLC');
INSERT INTO item (
        serial_no,
        quantity,
        quantity_sold,
        title,
        description,
        category,
        file_type,
        price,
        store_name
    ) VALUES ('VWF8C0OHLIHIST', 16, 44, 'innovate cross-platform content', 'Staff drop cultural include.', 'art', 'jpg', 5495, 'Flowers, Young and Russell');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('snyderhailey@gmail.com', 'samantha07@russell.com', '2020-08-29 15:16:56', '340919090620428');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('michael54@yahoo.com', 'kaylamayer@landry.org', '2020-04-02 16:31:00', '180041092484670');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamsheather@morales-brooks.biz', 'njohnson@mcdonald.com', '2020-06-08 05:32:40', '3508050248575942');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('daviesashley@wells.com', 'stephen95@browning.info', '2020-04-12 18:18:22', '574057563219');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnschultz@hotmail.com', 'kathy56@moore-mathis.net', '2020-04-18 03:45:35', '30444659052918');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kowens@rogers-elliott.com', 'kathleencoleman@gmail.com', '2020-01-06 20:33:00', '4633218150956922525');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('benjamin58@ward.com', 'jasoncampbell@gmail.com', '2020-11-21 00:02:49', '3516228607753454');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('colleenhaynes@gray-wade.info', 'michellejohnson@gmail.com', '2020-08-08 16:58:22', '4719434799957845');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jeremy89@hotmail.com', 'yjones@castro.info', '2020-06-25 00:49:02', '2282530364950510');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('andersonmatthew@yahoo.com', 'dawn99@hotmail.com', '2020-11-27 07:41:02', '676318555239');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('iadams@proctor-hill.org', 'adam17@richards.com', '2020-04-14 08:33:59', '213154797361480');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('sherioconnor@gmail.com', 'fclayton@cordova.info', '2020-07-21 20:47:32', '4848653357808272');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('zwest@williams.com', 'michael78@fox.com', '2020-08-16 10:03:12', '4521191352799');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnschultz@hotmail.com', 'wwallace@yahoo.com', '2020-06-12 13:35:47', '349237033966290');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vgarcia@hodge.com', 'vjackson@mcintyre.biz', '2020-05-23 04:09:46', '3534551175324921');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('xbarker@gmail.com', 'washingtonhailey@hotmail.com', '2020-09-29 04:00:23', '4828987124368929');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('joseph67@gmail.com', 'richardbass@moody-king.com', '2020-10-06 17:13:05', '4498444063054523');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('andersonmatthew@yahoo.com', 'mendezsusan@hotmail.com', '2020-08-03 06:04:06', '3517271146242935');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('sonya44@reid-jones.biz', 'nwiggins@gmail.com', '2020-03-05 04:18:01', '349801544271787');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonmichael@gmail.com', 'susan70@gmail.com', '2020-04-16 00:16:06', '574057563219');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('brenda23@schaefer-jenkins.biz', 'esmith@pierce.com', '2020-11-26 02:47:50', '2289321326002977');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('edwardsjonathan@hotmail.com', 'wle@yahoo.com', '2020-09-03 12:45:24', '4521191352799');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('adrianbartlett@hotmail.com', 'jtaylor@yahoo.com', '2020-02-22 18:22:39', '30477835624028');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('slawson@fisher.com', 'jordansandra@mcclain.com', '2020-04-13 13:01:16', '3501659955292181');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('knelson@frey.com', 'vfisher@yahoo.com', '2020-02-08 15:15:28', '3536160321955337');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('michael28@gmail.com', 'zallen@hotmail.com', '2020-03-20 04:19:57', '4543460637027830352');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonchristopher@yahoo.com', 'margarethoffman@howard.info', '2020-10-17 09:09:30', '370855314278994');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('yholmes@gmail.com', 'gabriellecummings@yahoo.com', '2020-03-18 09:32:06', '340295508943391');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('brandondominguez@hotmail.com', 'diana53@jackson.com', '2020-03-30 02:48:03', '3570556867375144');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('matthew89@gmail.com', 'osborneandrea@gmail.com', '2020-05-07 03:27:00', '344990918099737');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('coxangela@jones.com', 'boothshannon@lewis-hansen.biz', '2020-06-17 07:16:06', '30331781103554');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('znorris@hopkins.com', 'qwarren@gmail.com', '2020-04-26 14:26:16', '348853444087756');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gary51@yahoo.com', 'christopherwhite@weaver-young.org', '2020-09-28 00:19:45', '30127113918838');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('pthomas@gmail.com', 'fcarter@gmail.com', '2020-08-01 21:20:48', '4489409811604470938');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('coxangela@jones.com', 'jharvey@hotmail.com', '2020-10-29 08:56:21', '180077593488810');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamskatherine@yahoo.com', 'tarasmith@davis-sharp.info', '2020-02-12 17:05:51', '4305986920310863');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('prodriguez@yahoo.com', 'jennifer03@hotmail.com', '2020-08-24 21:21:35', '4719434799957845');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('julie67@hotmail.com', 'allisonguerra@fisher.net', '2020-05-11 13:30:31', '30444659052918');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('fcoleman@gmail.com', 'garylarson@brown.biz', '2020-06-29 08:13:48', '4956790602594005817');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('luislane@gmail.com', 'mitchellkevin@phelps.com', '2020-11-22 04:37:43', '6011109281841984');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('myersmark@hotmail.com', 'cameron50@french.com', '2020-10-13 21:35:21', '4547648628689');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonrobert@hotmail.com', 'greilly@dougherty-scott.info', '2020-01-18 10:38:42', '3549809732251547');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('bartonshelley@hotmail.com', 'singhcarla@white.com', '2020-03-23 12:51:00', '213165112153931');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('zwest@williams.com', 'smithvirginia@walker-johnson.com', '2020-02-03 20:29:17', '4771697049817');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('stevenwright@barnes-vargas.com', 'marshallsarah@hotmail.com', '2020-01-03 09:05:33', '3517978903108667');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('sherioconnor@gmail.com', 'williamsjohn@peck.com', '2020-08-10 13:09:16', '3570556867375144');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamsheather@morales-brooks.biz', 'johngonzalez@hernandez.biz', '2020-11-06 08:41:22', '4785003907708');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kmitchell@dorsey.com', 'andrewchung@yahoo.com', '2020-06-12 09:56:23', '213165112153931');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('ecooper@yahoo.com', 'brentgilmore@allen.com', '2020-11-13 16:59:19', '6011347557518684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('waltersmichelle@yahoo.com', 'evansalexandra@gmail.com', '2020-07-01 11:17:38', '4338695844647');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('james82@hotmail.com', 'denisewilliamson@hotmail.com', '2020-06-03 07:57:52', '4521191352799');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('cgomez@yahoo.com', 'allisonwebb@yahoo.com', '2020-04-01 11:40:59', '213140033136695');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('angela19@gmail.com', 'toni31@johnson-shannon.net', '2020-10-12 01:01:19', '568861960082');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('eperez@hotmail.com', 'williamsdavid@yahoo.com', '2020-11-01 10:14:45', '2706835545914451');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('james82@hotmail.com', 'katherineellis@yahoo.com', '2020-11-11 06:52:21', '4689283230746622');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('nconner@parker.com', 'jodi61@gmail.com', '2020-05-06 02:18:27', '3536160321955337');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('myersmark@hotmail.com', 'vcole@hotmail.com', '2020-10-10 20:12:05', '30331781103554');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('alyssa53@mcgrath.com', 'kimberlyfoster@hotmail.com', '2020-08-31 14:50:12', '3596945888719119');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('paulaskinner@gmail.com', 'richardvasquez@hotmail.com', '2020-06-24 22:56:37', '6538141179789540');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('zwhite@boyd.com', 'jessicathornton@yahoo.com', '2020-10-15 08:46:16', '4559003986299684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('victoria89@yahoo.com', 'lwhite@hotmail.com', '2020-06-02 18:40:07', '6590443986637937');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('ecooper@yahoo.com', 'juliesmith@garrett.net', '2020-05-19 09:26:59', '2720555385401292');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('aliciaryan@miller.com', 'qcunningham@ray-ayers.com', '2020-06-21 15:24:47', '3581513357645665');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('maryortiz@wright-wilson.biz', 'ymiller@yahoo.com', '2020-03-01 06:57:00', '30444910102882');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('howardjulie@adams.biz', 'moorejoe@yahoo.com', '2020-04-22 02:09:21', '4785003907708');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('sherioconnor@gmail.com', 'grodriguez@hotmail.com', '2020-06-18 07:09:39', '30444910102882');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('hatfieldjimmy@douglas.net', 'jared56@greene.com', '2020-11-28 05:46:16', '4192359929503');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('james82@hotmail.com', 'vschwartz@snow-monroe.com', '2020-05-05 20:23:05', '2711786866282262');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gary19@yahoo.com', 'brittanyrojas@gmail.com', '2020-06-26 21:05:11', '3538272944089036');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('chad36@hotmail.com', 'dthompson@rios-grimes.com', '2020-10-24 23:36:15', '4941704426368248');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamssarah@hughes-hill.org', 'hopkinssandra@padilla.info', '2020-06-15 00:36:54', '2245474419616600');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gallagherangel@pena-russell.com', 'brian26@chavez.org', '2020-04-03 11:41:46', '4382593402300761144');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('andersonmatthew@yahoo.com', 'btaylor@yahoo.com', '2020-10-20 17:22:35', '180071363072300');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('aliciaryan@miller.com', 'whitekatie@gregory.com', '2020-10-06 23:24:41', '3521333047668776');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnschultz@hotmail.com', 'johnny70@flynn.com', '2020-05-11 22:43:11', '4638385005974994854');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('alicia26@jones-farmer.net', 'gmyers@white-lloyd.info', '2020-03-13 07:44:21', '30228756769239');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('tdominguez@jensen.biz', 'david26@hotmail.com', '2020-11-20 01:05:42', '3596945888719119');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('lanejoan@taylor.info', 'thomasfrederick@hotmail.com', '2020-04-04 01:33:45', '180039854743523');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('michael28@gmail.com', 'jason65@tucker-jimenez.com', '2020-06-28 14:44:35', '2267312552819115');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('james82@hotmail.com', 'hbarron@porter.info', '2020-06-15 23:06:39', '4689283230746622');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('michaelshort@woodward-houston.com', 'owensterri@gmail.com', '2020-10-02 02:56:02', '4426611990249098');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('othomas@vazquez.info', 'jeffery15@yahoo.com', '2020-08-12 20:33:19', '213173088325731');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('wesleymitchell@hammond.biz', 'ublack@hotmail.com', '2020-03-17 02:11:39', '3501659955292181');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('eperez@hotmail.com', 'romandaniel@martinez-kelley.info', '2020-02-02 01:00:36', '675969137115');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('alicia64@moran.com', 'avilakeith@pennington.org', '2020-10-04 03:22:54', '2261065572607110');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('tchen@hernandez.com', 'djackson@patterson-jefferson.com', '2020-07-26 08:11:36', '4543460637027830352');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gary19@yahoo.com', 'dillonjeff@yahoo.com', '2020-06-21 03:09:48', '6576064931213489');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jmyers@wright-mitchell.org', 'nathan87@barr-shaw.com', '2020-06-13 13:40:49', '3594110926310056');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('zachary98@lee.com', 'kellieparker@yahoo.com', '2020-05-06 18:37:28', '3556198548111941');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gallagherangel@pena-russell.com', 'nbrown@gmail.com', '2020-09-18 02:39:15', '3571385164766535');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('matthew89@gmail.com', 'doylemakayla@flynn.net', '2020-11-20 19:53:21', '2706835545914451');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('tdominguez@jensen.biz', 'lisa33@foster.net', '2020-02-17 17:14:26', '3517978903108667');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vancenathan@rojas.com', 'lewisnicholas@jones.net', '2020-07-07 00:24:40', '6011916484943650');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('paulaskinner@gmail.com', 'jwagner@yahoo.com', '2020-03-02 01:28:10', '4080949201592');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamskatherine@yahoo.com', 'villadaniel@hotmail.com', '2020-08-18 07:57:44', '676318555239');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('javier78@berry.net', 'anthony15@yahoo.com', '2020-05-05 17:58:24', '4188495453329010740');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kgalvan@fisher.com', 'eadams@gmail.com', '2020-04-08 08:32:10', '4061976366639169328');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('prodriguez@yahoo.com', 'romeroeric@hotmail.com', '2020-10-01 09:30:12', '060472340490');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vhopkins@gmail.com', 'ashley46@fitzpatrick.info', '2020-09-16 21:47:46', '2560402818011914');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('julie67@hotmail.com', 'charles55@griffith-richard.com', '2020-07-13 08:28:39', '4845465059826');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jenniferroy@osborne.com', 'williamlandry@hotmail.com', '2020-04-12 23:27:06', '371621705048266');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('lauren96@mosley.org', 'joeltrujillo@yahoo.com', '2020-06-24 08:52:07', '3596902618739768');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('moyermelanie@aguilar.com', 'lisalin@lee-palmer.net', '2020-10-09 22:57:57', '370855314278994');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('parkstacy@gmail.com', 'theresa74@yahoo.com', '2020-08-28 16:21:12', '5274760201829980');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('sonya44@reid-jones.biz', 'ellisonkatherine@hotmail.com', '2020-05-25 13:25:05', '4618274224435286');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('ambermartinez@marsh.com', 'mary66@miller-alvarez.com', '2020-02-29 11:40:00', '3581513357645665');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('peter44@yu.com', 'deanlisa@yahoo.com', '2020-02-02 19:40:44', '6597569009941824');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('javier78@berry.net', 'isabellabass@gmail.com', '2020-01-29 22:47:34', '30477835624028');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('joseph82@williams-marsh.net', 'hocharles@hawkins.com', '2020-04-09 12:20:14', '3521333047668776');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('tapiadavid@hall.com', 'andrewsvictoria@yahoo.com', '2020-04-06 09:53:35', '6011816587940845');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vhopkins@gmail.com', 'boydnicholas@hotmail.com', '2020-02-20 18:23:59', '6011662698598357');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('joseph82@williams-marsh.net', 'patriciaking@gmail.com', '2020-11-10 13:07:56', '4498444063054523');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonkyle@porter.biz', 'brentsoto@zimmerman.com', '2020-11-07 13:58:09', '4848653357808272');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('luislane@gmail.com', 'cookeric@hotmail.com', '2020-08-18 18:14:33', '574562412951');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('masseychristian@johnson.com', 'millersherry@costa.com', '2020-06-17 11:23:54', '341271278155796');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('ginarusso@drake-miller.com', 'mjohnson@rogers.net', '2020-10-11 13:44:12', '3538272944089036');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vincenttaylor@gonzalez-austin.com', 'alejandrahunt@smith-peterson.com', '2020-07-23 11:11:10', '180077593488810');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('hatfieldjimmy@douglas.net', 'bellalexander@yahoo.com', '2020-09-14 02:48:38', '6011109281841984');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('andersonmatthew@yahoo.com', 'coreyforbes@roberts.com', '2020-08-21 08:24:03', '6011347557518684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gary51@yahoo.com', 'sharonclark@romero.com', '2020-08-24 06:07:49', '4498444063054523');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('michael98@yahoo.com', 'royholt@reynolds.net', '2020-02-16 09:48:01', '4784907845043152799');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vhopkins@gmail.com', 'eileen52@gmail.com', '2020-06-02 08:45:31', '3516228607753454');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('clarkjonathan@yahoo.com', 'alan51@jones.com', '2020-07-21 03:00:34', '4080949201592');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonrobert@hotmail.com', 'benjamincoleman@hicks.info', '2020-03-24 21:11:24', '2261065572607110');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('ecooper@yahoo.com', 'franklinmallory@gmail.com', '2020-04-02 05:31:32', '676282771804');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('howardjulie@adams.biz', 'ydiaz@jones.com', '2020-12-02 19:45:56', '30169335131592');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('sacosta@li.com', 'iward@cole.com', '2020-10-25 09:12:22', '4498444063054523');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vicki85@yahoo.com', 'xrobinson@hotmail.com', '2020-02-04 13:27:04', '6561410715510631');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('sacosta@li.com', 'murphytammy@gilmore.org', '2020-04-22 19:16:39', '4188495453329010740');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('smithtommy@brown.biz', 'bonilladavid@bates.com', '2020-08-28 14:23:05', '3534551175324921');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gary51@yahoo.com', 'pabbott@lopez.com', '2020-10-31 13:56:17', '568601249929');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('xbarker@gmail.com', 'omarward@yahoo.com', '2020-03-17 06:42:53', '180016592288672');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('edwardsjennifer@yahoo.com', 'masseyjustin@yahoo.com', '2020-01-26 16:52:12', '213102169918502');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('waltersmichelle@yahoo.com', 'jessica43@matthews-austin.biz', '2020-05-14 00:48:47', '30426809309793');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('daniel43@nelson.biz', 'stewartjeanette@hotmail.com', '2020-03-25 00:23:50', '4807256648318553691');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('nancyclark@yahoo.com', 'pjackson@yahoo.com', '2020-11-11 23:07:59', '2283190391502799');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('amy28@hotmail.com', 'kentashley@yahoo.com', '2020-07-27 15:27:27', '343110641372308');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('waltersmichelle@yahoo.com', 'nwilliams@young.net', '2020-10-18 13:39:54', '6505537136570262');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('slin@yahoo.com', 'padillanancy@eaton.com', '2020-09-25 16:34:21', '343110641372308');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('solson@hotmail.com', 'ucarrillo@king-sparks.com', '2020-06-05 14:17:00', '3517250113173687');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonmichael@gmail.com', 'wlong@mahoney.com', '2020-11-22 09:26:10', '3581513357645665');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('cindygonzalez@hotmail.com', 'jennifershelton@gmail.com', '2020-01-21 16:34:27', '4080949201592');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jenniferroy@osborne.com', 'donaldsonwilliam@yahoo.com', '2020-02-25 16:27:03', '568601249929');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamsheather@morales-brooks.biz', 'rarmstrong@hotmail.com', '2020-09-08 00:31:54', '180077593488810');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kallen@frye-dawson.com', 'iperez@terrell-walker.com', '2020-05-03 18:25:41', '4825247690181831');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('wileylisa@gmail.com', 'bwalton@hotmail.com', '2020-01-30 14:58:03', '4417563425652010091');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonkyle@porter.biz', 'daviddunn@brewer.com', '2020-09-27 06:08:39', '180016592288672');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('amyjohnson@gmail.com', 'maria45@yahoo.com', '2020-06-05 17:36:57', '4707232440558');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonmichael@gmail.com', 'milesdaniel@hotmail.com', '2020-03-24 19:33:21', '568601249929');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vincenttaylor@gonzalez-austin.com', 'todd66@hotmail.com', '2020-02-17 22:13:35', '4689283230746622');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('cooperroy@weaver.info', 'samuelvillanueva@hunt.com', '2020-01-31 00:00:31', '4899402739150799');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('skaufman@thomas.com', 'csmith@yahoo.com', '2020-04-12 03:53:58', '6011816587940845');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('cooperroy@weaver.info', 'larryclark@davis-austin.com', '2020-12-03 16:59:04', '676259142476');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('wmcconnell@brown.org', 'jenniferosborne@smith-escobar.com', '2020-11-03 01:20:54', '3503220708307277');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnschultz@hotmail.com', 'gilbertvictoria@hamilton.net', '2020-01-08 01:26:54', '180039182283010');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kallen@frye-dawson.com', 'hopkinsshawn@williams.biz', '2020-07-04 04:54:27', '180041092484670');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('xbarker@gmail.com', 'jimmy50@duncan.biz', '2020-01-29 14:30:06', '213102169918502');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('twillis@hotmail.com', 'brian68@hotmail.com', '2020-10-31 09:41:53', '30444910102882');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('reesegabriel@hotmail.com', 'caleb26@yahoo.com', '2020-07-05 18:35:09', '3507102433596919');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('znorris@hopkins.com', 'klinebruce@hodge-patel.org', '2020-07-31 17:30:42', '3510434087866602');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamsheather@morales-brooks.biz', 'teresa23@gmail.com', '2020-08-09 02:36:15', '3531510502749963');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('brenda23@schaefer-jenkins.biz', 'ysherman@figueroa.com', '2020-01-14 05:32:28', '180039182283010');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('samantha06@osborne-williams.org', 'abrown@hotmail.com', '2020-04-26 22:00:28', '3534297077872902');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('waltersmichelle@yahoo.com', 'cynthiakennedy@coleman.biz', '2020-01-17 17:00:11', '180016592288672');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('solson@hotmail.com', 'danieltravis@barnes-perkins.com', '2020-05-04 08:25:35', '3536160321955337');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('alicia26@jones-farmer.net', 'kristin18@hotmail.com', '2020-01-21 06:48:55', '3598669543347060');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('wileylisa@gmail.com', 'kennethlong@hotmail.com', '2020-07-02 08:34:33', '4900645776029782');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('snydershaun@yahoo.com', 'baileykathryn@wilson.info', '2020-06-10 02:01:14', '4503000646153969');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('dwilliams@yahoo.com', 'drios@gmail.com', '2020-02-20 15:38:48', '6011867412612224');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('solson@hotmail.com', 'eugenebryant@gmail.com', '2020-11-12 10:18:34', '4771697049817');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('brandondominguez@hotmail.com', 'johnevans@yahoo.com', '2020-09-10 10:59:34', '4489409811604470938');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('slin@yahoo.com', 'jhoward@rivera-rodgers.com', '2020-11-17 06:54:06', '36763202192952');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('colleenhaynes@gray-wade.info', 'icummings@gmail.com', '2020-08-08 18:45:20', '4645029277102275');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('javier78@berry.net', 'fedwards@stephenson.com', '2020-04-12 14:26:49', '3570556867375144');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('waltersmichelle@yahoo.com', 'schroedercarla@hotmail.com', '2020-07-26 02:15:17', '372472112232633');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonmichael@gmail.com', 'ucabrera@taylor.org', '2020-03-25 07:16:57', '4489409811604470938');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vgarcia@hodge.com', 'lori28@bray.info', '2020-03-27 03:20:13', '30444659052918');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jonathandavis@rodriguez-webster.com', 'zharrison@gmail.com', '2020-05-04 06:04:19', '4645029277102275');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('smithtommy@brown.biz', 'nburke@gmail.com', '2020-07-04 11:17:06', '3594110926310056');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('mahoneyolivia@hotmail.com', 'dhansen@ramirez.net', '2020-06-30 08:36:17', '676319122997');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jeremy89@hotmail.com', 'campbelljennifer@thompson.com', '2020-06-12 10:39:37', '4498444063054523');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('pcoleman@gmail.com', 'erichenderson@johnston-riley.com', '2020-11-30 04:04:19', '2231263026766056');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('othomas@vazquez.info', 'psmith@best.com', '2020-03-13 22:30:08', '3517312324074672');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('hschmidt@nelson-gross.org', 'ihowell@french.com', '2020-08-28 11:43:46', '2706835545914451');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('javier78@berry.net', 'nancy53@yahoo.com', '2020-09-30 13:10:59', '4282951340419584');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('aliciaryan@miller.com', 'levyandrew@meyer.biz', '2020-05-01 02:11:38', '4126476480376030');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('daniel43@nelson.biz', 'douglasnelson@yahoo.com', '2020-05-24 16:56:33', '3560576805127318');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('nconner@parker.com', 'beankathryn@cooper.biz', '2020-04-17 14:28:06', '4784907845043152799');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamsheather@morales-brooks.biz', 'darryl80@gmail.com', '2020-04-09 14:01:01', '3556198548111941');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jennifer30@hotmail.com', 'jenniferbaker@blake.com', '2020-06-13 11:30:05', '6561410715510631');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamsheather@morales-brooks.biz', 'janet54@murray-stark.com', '2020-11-14 14:03:16', '4872139078829564');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kallen@frye-dawson.com', 'guzmanstephen@mccarthy-perkins.org', '2020-01-25 19:16:32', '30158139414312');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('victoria89@yahoo.com', 'gamblerobert@hotmail.com', '2020-08-15 13:17:05', '2660260676905372');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('armstrongmatthew@yahoo.com', 'melissamata@yahoo.com', '2020-10-08 10:08:42', '3581513357645665');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('bethanybailey@lozano.com', 'alexandernathan@hotmail.com', '2020-09-14 15:15:12', '4073958713174947');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('michael71@barajas.com', 'katherinegutierrez@jackson.com', '2020-01-27 06:56:35', '3559639914068550');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('julie67@hotmail.com', 'william70@hotmail.com', '2020-07-24 12:02:00', '3555141773317453');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('joseph82@williams-marsh.net', 'evansmolly@ramirez.net', '2020-08-03 22:48:26', '6590443986637937');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('daviesashley@wells.com', 'carriejenkins@gmail.com', '2020-03-27 05:53:06', '349104296546385');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('xbarker@gmail.com', 'lrowland@monroe-kaufman.com', '2020-09-16 06:11:43', '4127592125733');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonrobert@hotmail.com', 'amanda14@berry.org', '2020-06-30 09:27:58', '6538141179789540');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonmichael@gmail.com', 'charles96@hotmail.com', '2020-03-06 09:58:30', '2289321326002977');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('ambermartinez@marsh.com', 'mooreanne@smith.biz', '2020-05-08 10:54:21', '6502165589609735');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('cgomez@yahoo.com', 'flawson@price.com', '2020-10-19 12:48:23', '340919090620428');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('snydershaun@yahoo.com', 'oliviasmith@yahoo.com', '2020-06-10 13:29:33', '180039854743523');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('wileylisa@gmail.com', 'pittmansandra@hotmail.com', '2020-09-08 19:47:05', '30403019229194');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('hlee@yahoo.com', 'amy95@gentry.biz', '2020-08-27 15:11:52', '568861960082');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('cgomez@yahoo.com', 'istanley@evans.net', '2020-09-26 19:37:46', '213108792674370');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('pcoleman@gmail.com', 'bferrell@burton-bailey.com', '2020-09-08 13:01:30', '6576064931213489');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('seanthompson@schneider.net', 'ashleenelson@gmail.com', '2020-08-19 19:15:57', '2250898986633758');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('klinelinda@gallegos.org', 'angela88@cooper-curtis.com', '2020-07-21 23:54:36', '2245474419616600');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('daviesashley@wells.com', 'brandi53@flores-montoya.net', '2020-07-17 23:45:09', '4080949201592');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gary51@yahoo.com', 'melissa72@hotmail.com', '2020-07-04 01:32:39', '5274760201829980');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('melissaadams@gonzalez-mcdowell.biz', 'jerry07@yahoo.com', '2020-09-13 01:18:04', '4547648628689');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('alicia26@jones-farmer.net', 'rebeccabradley@hotmail.com', '2020-11-24 15:29:48', '4853180767713752255');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('gary19@yahoo.com', 'dominique14@yahoo.com', '2020-09-19 00:16:55', '4289878025367858');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('esmith@hotmail.com', 'sylvia48@gmail.com', '2020-02-19 11:18:04', '4559003986299684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('acuevas@gmail.com', 'wilkinsmercedes@anderson.com', '2020-05-05 22:17:47', '30158139414312');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('alisonmichael@yahoo.com', 'jerry80@yahoo.com', '2020-01-25 06:21:31', '4579791584206109774');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('iadams@proctor-hill.org', 'karen67@yahoo.com', '2020-03-25 15:34:16', '4192359929503');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('javier78@berry.net', 'amy01@yahoo.com', '2020-03-01 23:16:50', '344615101254258');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('shaffermaria@yahoo.com', 'scampbell@wells-morgan.com', '2020-01-27 14:08:03', '4126476480376030');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('grace48@garrett-garza.org', 'piercecynthia@gmail.com', '2020-05-25 10:25:05', '30403019229194');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kowens@rogers-elliott.com', 'nicholas63@west.biz', '2020-08-01 19:28:12', '3584492530540522');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('tdominguez@jensen.biz', 'garretterin@fernandez.biz', '2020-02-20 23:18:11', '4579791584206109774');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('parkstacy@gmail.com', 'reynoldsshawn@davis.com', '2020-06-17 18:46:16', '6590040412652579');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('angela19@gmail.com', 'bentleywesley@hotmail.com', '2020-06-13 11:30:23', '5255198101373002');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('romerocaleb@crawford.com', 'colleenmiller@james.com', '2020-04-29 08:51:07', '5169464184310336');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kmitchell@dorsey.com', 'jocelyngreene@yahoo.com', '2020-01-16 04:21:09', '4489409811604470938');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('asullivan@pierce.com', 'turnerkelly@cannon.com', '2020-08-07 07:28:03', '4784907845043152799');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonmichael@gmail.com', 'newmanbryan@dunn.com', '2020-01-30 23:21:03', '4956790602594005817');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('bryanttracy@bruce-brown.com', 'william94@yahoo.com', '2020-02-01 06:39:06', '4338695844647');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('hatfieldjimmy@douglas.net', 'serranonoah@collins-perez.com', '2020-07-16 20:49:57', '2711786866282262');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('melissaadams@gonzalez-mcdowell.biz', 'suarezwanda@gmail.com', '2020-07-04 11:24:26', '5274760201829980');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('brenda23@schaefer-jenkins.biz', 'brandon86@yahoo.com', '2020-03-04 16:44:15', '4650712176543371020');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('tchen@hernandez.com', 'ashley86@parker.com', '2020-05-24 21:01:41', '4382593402300761144');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('klinelinda@gallegos.org', 'ricejoseph@harrington.com', '2020-01-27 20:44:27', '30415719985628');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('joseph82@williams-marsh.net', 'ygarcia@yahoo.com', '2020-06-13 21:35:16', '6011109281841984');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('pthomas@gmail.com', 'amber89@gmail.com', '2020-07-05 23:49:17', '3560576805127318');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('michael54@yahoo.com', 'johnduncan@hotmail.com', '2020-02-23 22:06:57', '630488682711');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('rcraig@yahoo.com', 'caseerik@gmail.com', '2020-06-21 19:39:35', '4662162984424027');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('brenda23@schaefer-jenkins.biz', 'christopher61@yahoo.com', '2020-11-05 15:27:27', '345369153656684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jenna75@gmail.com', 'gilljeremy@hawkins.com', '2020-07-27 08:17:27', '676259142476');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('pcoleman@gmail.com', 'jeff68@hotmail.com', '2020-05-24 19:20:39', '213154797361480');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('turnermichael@yahoo.com', 'stephanie22@hotmail.com', '2020-03-23 16:07:26', '3517312324074672');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('parkstacy@gmail.com', 'cynthiaweeks@anderson-vaughan.com', '2020-10-03 19:36:43', '2272908237254967');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('pthomas@gmail.com', 'acostarobert@yahoo.com', '2020-05-24 11:26:50', '4650712176543371020');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('dwilliams@yahoo.com', 'franciscocruz@yahoo.com', '2020-01-14 12:11:31', '213118640311240');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('brandon64@hotmail.com', 'qmcdonald@hopkins.biz', '2020-09-09 12:46:42', '4494592352654345818');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('rgonzalez@yahoo.com', 'maylindsey@yahoo.com', '2020-01-31 03:55:48', '4171422261185');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonchristopher@yahoo.com', 'jzuniga@turner.biz', '2020-09-11 04:31:03', '3547830512011424');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('angela19@gmail.com', 'valdezkristy@lee.com', '2020-10-11 17:05:55', '4707232440558');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('philip98@bishop.com', 'lsnow@hull.com', '2020-04-15 03:24:33', '340919090620428');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('kcarter@ramirez.com', 'stephen35@fuller.com', '2020-10-28 12:41:15', '4496676044627');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('james82@hotmail.com', 'paige17@henderson.net', '2020-04-10 20:55:43', '349801544271787');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('cindygonzalez@hotmail.com', 'lisa05@adams.com', '2020-03-02 00:14:20', '6011347557518684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamsheather@morales-brooks.biz', 'rachel40@thomas-booth.net', '2020-01-23 19:50:29', '3537943540614630');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('romerocaleb@crawford.com', 'antoniobennett@hodges.org', '2020-09-11 08:42:29', '2720555385401292');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('julie67@hotmail.com', 'cwilson@warner-moore.com', '2020-04-15 15:49:17', '4305986920310863');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('iadams@proctor-hill.org', 'larry79@martin-gray.net', '2020-04-07 00:13:54', '676259142476');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('seanthompson@schneider.net', 'jennifer87@gmail.com', '2020-02-23 23:28:31', '4872139078829564');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('howardjulie@adams.biz', 'gowens@yahoo.com', '2020-03-04 18:55:14', '345369153656684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('bryanttracy@bruce-brown.com', 'gregory34@hotmail.com', '2020-07-01 07:49:41', '3590476474430073');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('charlesfoster@vega-mendoza.com', 'debrathomas@yahoo.com', '2020-02-22 20:42:22', '4207090649127813477');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vhopkins@gmail.com', 'whitejames@ross.org', '2020-01-15 09:55:27', '4338695844647');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('romerocaleb@crawford.com', 'starkkristi@yahoo.com', '2020-06-16 20:27:08', '6538141179789540');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('anthonyflowers@gmail.com', 'brittany48@hotmail.com', '2020-01-07 02:53:39', '3556198548111941');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('esmith@hotmail.com', 'brandonsaunders@nichols-joyce.biz', '2020-03-06 00:47:55', '3518934409400206');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('brandon64@hotmail.com', 'donnasmith@gmail.com', '2020-04-01 14:56:19', '676119328257');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('michael71@barajas.com', 'adam91@hawkins.com', '2020-03-03 06:36:08', '30449649017376');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('edwardsjennifer@yahoo.com', 'duane41@yahoo.com', '2020-09-08 18:18:22', '4014302481100283');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('ambermartinez@marsh.com', 'abarr@carter.com', '2020-04-02 19:58:47', '4689580759786495');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('alicia26@jones-farmer.net', 'brookelewis@hotmail.com', '2020-01-20 04:22:22', '4719434799957845');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('johnsonmichael@gmail.com', 'grosssharon@perez.net', '2020-03-25 22:38:45', '370855314278994');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('linda24@jones-compton.com', 'robert32@gmail.com', '2020-09-06 12:16:15', '6561410715510631');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('matthew89@gmail.com', 'michael27@spencer.com', '2020-04-10 07:04:32', '36827231491865');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('aliciaryan@miller.com', 'franciscostewart@gmail.com', '2020-05-10 09:55:39', '348853444087756');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('fcoleman@gmail.com', 'walter37@soto.biz', '2020-08-28 05:03:18', '4114372882491267');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('williamssarah@hughes-hill.org', 'kwise@watson.com', '2020-06-22 06:45:49', '3596902618739768');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jonathandavis@rodriguez-webster.com', 'sarah50@brooks-phillips.net', '2020-11-30 23:06:55', '3543877956473069');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('christopherlane@hotmail.com', 'morganharrison@gmail.com', '2020-03-26 21:11:06', '4807256648318553691');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('waltersmichelle@yahoo.com', 'steveflores@lopez.net', '2020-07-12 04:29:05', '373150292419647');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('angela19@gmail.com', 'xavier93@mullins.com', '2020-10-08 05:59:15', '4852955654988969');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('peter44@yu.com', 'jking@gmail.com', '2020-08-27 16:16:06', '348853444087756');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('xmyers@hotmail.com', 'zlozano@taylor.org', '2020-02-12 09:57:57', '3564604805834877');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('peter44@yu.com', 'bushbrenda@gmail.com', '2020-05-28 06:12:23', '3534297077872902');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('joseph67@gmail.com', 'spencerkristina@smith.com', '2020-04-14 11:49:52', '4559003986299684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('hillapril@jenkins.com', 'qpeters@torres-hamilton.com', '2020-06-27 07:21:08', '676259142476');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('vhopkins@gmail.com', 'diana24@lane-fischer.com', '2020-10-05 23:36:52', '4503729883325175');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('slawson@fisher.com', 'jenna95@hotmail.com', '2020-11-21 21:16:23', '6590040412652579');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('smithtommy@brown.biz', 'sonya72@hotmail.com', '2020-08-03 21:48:43', '4503729883325175');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('joseph82@williams-marsh.net', 'davidshaw@gmail.com', '2020-02-02 20:42:36', '213138361011134');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('william12@fisher.com', 'rflynn@gmail.com', '2020-11-18 09:47:15', '4634362536445');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('hlee@yahoo.com', 'melissa79@hotmail.com', '2020-03-02 02:44:46', '213173088325731');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('maryortiz@wright-wilson.biz', 'torresjohn@buck-martin.com', '2020-08-04 04:47:04', '213170401248293');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('znorris@hopkins.com', 'rogersmith@yahoo.com', '2020-02-27 22:48:38', '3503220708307277');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('parkstacy@gmail.com', 'deborah28@avila.org', '2020-03-30 08:39:13', '3584492530540522');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('oliviawallace@duncan-west.biz', 'brandonlopez@gmail.com', '2020-10-25 17:29:23', '345369153656684');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('jennifer30@hotmail.com', 'douglas82@hotmail.com', '2020-08-08 21:51:10', '3564236160112654');
INSERT INTO 'order' (
        buyer_email,
        delivery_email,
        timestamp,
        card_no
    ) VALUES ('klinelinda@gallegos.org', 'michaelnguyen@gmail.com', '2020-04-07 05:31:11', '3584492530540522');
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, '53F6XOJ1JUIB', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'SANR15W261T', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'VNFQD1PRQSES92H', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'Z00K1Q', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'P8YT53FSZ0KG', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'CM3XLMHENI7S8UOPK', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'WGPHLEQ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'YTT6USN5BCYA', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, '8GIVGTLBQM6Z7J2D4GEK', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'V2U95QBAM', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, '6MA0OT1J2', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'WK8M1SJJ5IRDHDS', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, '0J7QVKSSD', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'SGDU4TYC3Z2CTBO02O', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'A2EPH58ZDGO7J', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'D5X3JMCXX', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'HQRQELWCEHW', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'C2X22WDYBYOD8A1H8X9XC', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'ZCDOKYIXEJ7UHB0WXVT', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'LYBLSUB7S10666J6VJOCJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'FNJP0CUCSX2G282D26L58', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, 'HUFMZDU8S', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (1, '45E2D7MV4MJN0', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'QYYXP', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, '5XOH5', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, '288Y1JHE2K', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'CWO0WGF5R', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, '5A2HLJ6P', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'BH5BATRJWJY', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, '9GSJMDS78HQN', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, '2CID2PM88ZLMUDAL', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'UCVPPZOYXWYY1IQ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, '6WMZLW55AV0D86', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'UUSH3D8PB8YBW6Z', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'Y2Y239JDBZL66K3', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'Y0D4BUL8', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'JYSNDB7QNJ62KFLHS1IME', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, '8871TAL4EDLF5BCYGA5S', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'BVTXD071JBIUY', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'XTYF9MP6T4E8C3P2R2VJ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'MVO34C', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, '5FKZ5E1M87QESJ30Q', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'YXRFHRLQ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'XLVYCBFBC03JVAQG', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'J6KSOE45K2VT2WS', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'N02AJ1BU62TVQAV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (2, 'OQ3J8K5O6JQ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (3, 'XHYK1', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (3, 'FNJP0CUCSX2G282D26L58', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (3, '0I8XSK1UG5C3X', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (3, '97QPRUTYL', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (3, 'Y0D4BUL8', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (4, 'Z0XA0YOXAY6UO10', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (4, 'BUE03EPCMK5CN5W86K7', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (4, '7UGDOWFW37N7HBK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (4, 'P9K4TFHA36EYQVU', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (5, 'R0UDL5T0Q', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (5, 'DLTZVZJ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (5, '4FQOB', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (5, 'D3KWLC77', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (5, 'YN2SDTYRD0CIJ72KKJK', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (6, 'ZT29H850LSWEYUZ3SSAZU', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (6, 'A9ACTJAH3F', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (6, 'D31Z42Z', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (6, 'KQSJZL6L31I5BAKXS', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (6, '5IBBA7O5O7HU08J', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (6, '7FN4G7FYOI18A2AQVD', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (6, 'IL3GL4T', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'VPKLW00GUMQ89S7QV', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'F56V57VNWTG0PEW', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'VF3A3D', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, '8JVZWM0IHY17XX', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'ZCDOKYIXEJ7UHB0WXVT', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, '13URU71I0ET52TX', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'BHOXCIQ5EP4DJ34JF6', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, '4BQVNNGVBJ7GK5W121', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'JJNV2CO48TXANYNFBKDI2', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'B6L7BDOA', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'CUQUP009JQLD4ZRBZS', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, '6OAUBOFNMM4799S88V', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'PRBQVB3CP8C', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'XHYK1', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'WSZK32VL95', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'XZPVJMYIMHH', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, '5YXOUQ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'N02AJ1BU62TVQAV', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'F0U1TA', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, '2I43566IFBO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'EK23AQZCHC1A', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'CIAALP', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, '9GSJMDS78HQN', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'L1XOEG68Y1O9P', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'VNFQD1PRQSES92H', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (7, 'JVDOL8R', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'VI9T9PFU02Y4M3P3PUUPE', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'MV6XK', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'ZCDOKYIXEJ7UHB0WXVT', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'CUQUP009JQLD4ZRBZS', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'NB24TDA92', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'NIAUET3FH6CU', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'ASTLCU', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'V2U95QBAM', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'IKPREAG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, '53F6XOJ1JUIB', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'OVM4J', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'MQ8F85J465QUJDU4RLTD', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'CYMMQQMYEWRO6CB5XS9P', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'Y883RPGH7U', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, '4ASMEMPZMUTTPV', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'EGDFF193GSKZX', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'B5B2RB', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'MVO34C', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, '0MWSLI7P1QKZZ4', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, 'WV8XBDGHNU2CT6SY', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (8, '5QQQHCZ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (9, '2IS59RXMJQH6K', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (9, 'QQEYO7KC8BSL5FJ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (9, 'S1E2GSVTJQ8FDCMKRRGI', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (9, 'CNB4GX0R2UPU', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (9, 'OVM4J', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (9, 'IRJVC7CDJH2UTY011', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, 'SGDU4TYC3Z2CTBO02O', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '2IS59RXMJQH6K', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, 'HSBGDO', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, 'OWP3D0V', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '99QTL5HHJXO8BAPA55VO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '981M45J7A6LBAE', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '1AHOY', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '0J7QVKSSD', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '22K2FGBX3B7MGM3D4U', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, 'CWO0WGF5R', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, 'LHK0T9S', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '7SPGQCTJ83R7DVZD', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '77ATEV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '1OV0H27YQSDB4', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '7UGDOWFW37N7HBK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '7YNBEF', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '9LNGWY5DWNPA51K2', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '949BZO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '97QPRUTYL', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (10, '0M2JXDCLZ0', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (11, 'ELM3O84ALTOWXZH9BYT', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (11, 'GS0MI64', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (11, 'L1XOEG68Y1O9P', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (11, 'TZYP10H0544', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (11, 'SGDU4TYC3Z2CTBO02O', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (11, '5X84IINRW', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (11, 'CXWEZJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (11, 'Y2N0RN', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (12, 'WPF946Y2FHYCJCVBZ5DS', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'M79CEQBO', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'MUJZQQ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'WUUPSVKB6AIT9P8FWBLB2', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'HFO63EMAFK5M4V0PD5V8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '9DGZDOJSMHYA', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'FNJP0CUCSX2G282D26L58', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '8GIVGTLBQM6Z7J2D4GEK', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'J5C70PD4F9807NC5', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '30OR6SWDE690', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'MHBKQ5MZ0SH36X', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '5PQJ744', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '13QF5RTP', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '7NFADWE0UFFHJAVV', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '86WVI35UB8ONK4BG92', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'UVVHVAESPAV8HXMX45', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '2SW2XT1PPYX', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'R0UDL5T0Q', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'ZD2CRTD', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'T43XM4QIZMCXKVUXFLYB', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'ELM3O84ALTOWXZH9BYT', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'NS1I9XWC', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'N1CTQN1AEDWM04Q00', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'D5X3JMCXX', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '0J7QVKSSD', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, '5YXOUQ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (13, 'YN2SDTYRD0CIJ72KKJK', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (14, 'AJ7OC2KWG', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (14, 'ZGDI8EJIXNAIHAUG0V', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (14, 'W7SM1', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (14, 'Y2Y4H', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (14, 'YUJ72682YR6XBDTDSKH', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (14, 'UFILA9KZ2QEMYG76', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (14, 'XAT20KDG7EMM7', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, 'NIAUET3FH6CU', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, 'N55RS7PHXKJZ283K', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, '3BVQ0WX4BBQRYZ0K3O0R', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, '97N27TIYC', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, 'UQ0M7JMGK', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, '41UPBXWORKVV7PPAMXM', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, 'DX04DLJ1O', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, '8871TAL4EDLF5BCYGA5S', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, 'QIO1AG64EYG02PKZEF6', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, 'KHS02Q99V', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, '27MCUEOD4FUNSK', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (15, '2ITL25BIV7E2VW2THO', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (16, 'MF44FFETGVBGI2L506L', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (16, '22K2FGBX3B7MGM3D4U', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (16, 'WPF946Y2FHYCJCVBZ5DS', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (16, '7SPGQCTJ83R7DVZD', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (16, 'XMMDEQZECUBMWVS8', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (16, '07GN343YO8ISA6', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (16, '57VGLO', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (16, 'EK23AQZCHC1A', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'L9HEMTXMNU1S8JULJX', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'O17E3BH6NFU', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'ILQNSNAUOE8', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'L8R0R2CPTTN2Z0SQ55BV', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'SJZRNHN', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'PWJQE', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'CNB4GX0R2UPU', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'N02AJ1BU62TVQAV', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, '020UJRJD', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'NKUPQ7U18D994E', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'MA4BF371H1LMWOCJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'CJ8GR5XGB9XNXCW4LKME', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'LGHJM2WK9TCOOI4MJEE', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'EGDFF193GSKZX', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, 'AXF6A09GKL6POJ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (17, '04GWNLKR', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (18, 'WV8XBDGHNU2CT6SY', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (18, '99QTL5HHJXO8BAPA55VO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (18, 'A9ACTJAH3F', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '1XSJFSKVS6C8', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'JJNV2CO48TXANYNFBKDI2', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'Z485XQ48L6M', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '99QTL5HHJXO8BAPA55VO', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '13URU71I0ET52TX', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'C4XWVFZ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'SCH5S98F9C9FLIBD1QX4', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'NIAUET3FH6CU', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '02C91G77F9S3T', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'JVDOL8R', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'J6KSOE45K2VT2WS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '4L1DW5PKXJ55', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'UQ0M7JMGK', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '97N27TIYC', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'C8IA6', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '5K4EC6Y', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'WSZK32VL95', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'EY9BOWO0ONREKII9SYIQG', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'R0UDL5T0Q', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, 'V2U95QBAM', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '8JVZWM0IHY17XX', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (19, '1OV0H27YQSDB4', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, '2K7X7R3APTU1FDLSP84', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'B5B2RB', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'XZPVJMYIMHH', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'KHS02Q99V', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'MT9WD29UG1D8JKZXYHBR', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'EK23AQZCHC1A', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, '7SPGQCTJ83R7DVZD', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'MLERQAU3CZW9Y3C', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'EIJ6PEH88HT81OTQ1', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'MQC9YX5NTF169OM1', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, '8JVZWM0IHY17XX', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, '30OR6SWDE690', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, '5IBBA7O5O7HU08J', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'Y2N0RN', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'GS0MI64', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'MHBKQ5MZ0SH36X', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (20, 'CM3XLMHENI7S8UOPK', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (21, 'VNFQD1PRQSES92H', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (21, '1S7WS7PKONTWYWX4', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (21, 'D4U6ZK8KO3U9N', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (21, '6LSVLO3ERNTRZJHG0G', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (22, '1OV0H27YQSDB4', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'WDWIEDU09', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, '4Y6Z9X12', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'N55RS7PHXKJZ283K', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, '949BZO', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'J6KSOE45K2VT2WS', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, '2SW2XT1PPYX', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'IL3GL4T', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'XZPVJMYIMHH', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'HQRQELWCEHW', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, '3OT4U0OZFD95E9K', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'HK06V2AR', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'XK54KCGLQF9VX01VVB40', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'BDAAVO', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'XLVYCBFBC03JVAQG', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (23, 'ZGDI8EJIXNAIHAUG0V', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (24, '4ASMEMPZMUTTPV', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (24, 'W4GWGW5T9D8MKGC23', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (24, '699OPJEQ5B20HL07', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (24, 'BVTXD071JBIUY', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (24, 'D3KWLC77', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (24, 'DX04DLJ1O', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (24, '5X84IINRW', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'R0UDL5T0Q', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, '67IEX5TA4Z39PC', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, '07GN343YO8ISA6', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'Y0D4BUL8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'HXQOFUOQ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, '2C67F990PDFNMH2KND', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'IDAWON', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'Q7YGYZ0S40T', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'XTKKXBLZZBX93GS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'PH7NZ3', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, '27MCUEOD4FUNSK', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'RI5SPSRSS1R29UB', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'XK54KCGLQF9VX01VVB40', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'LN0AZUKE0A1TMT3GJ59', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, '5YJUXY2VSUV5XI5G3DIZ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (25, 'F56V57VNWTG0PEW', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'C3FREM', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'D8TJJICNEOV82', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'CYMMQQMYEWRO6CB5XS9P', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, '5UYBB7', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'PDC44U9YAF75YQQJG', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'B5B2RB', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, '981M45J7A6LBAE', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'JVDOL8R', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'JU7F89YBYG0OZOFS', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'UFILA9KZ2QEMYG76', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'MA4BF371H1LMWOCJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, '5YXOUQ', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'O8KRDW60J3K0XRHDT6XDT', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'BDAAVO', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'MJZ47QMOV', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'DITF47NV9AH76', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'L3IIEMC1WYM3W1KGXQ9R1', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'LGHJM2WK9TCOOI4MJEE', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, '97N27TIYC', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'KHS02Q99V', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, '8871TAL4EDLF5BCYGA5S', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, '5QQQHCZ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'IKPREAG', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, '04GWNLKR', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'QCO6X9ETFPG15BL2', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (26, 'SJZRNHN', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'QVA2UM9VYSWZ2VV', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, '45E2D7MV4MJN0', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'GFN4N4GWD', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'MF44FFETGVBGI2L506L', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'DX04DLJ1O', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'X6W6X5GILAJ2', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'WUUPSVKB6AIT9P8FWBLB2', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'NZ8EK6Z7CO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'Y2Y239JDBZL66K3', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'MLERQAU3CZW9Y3C', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'D3KWLC77', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'P8YT53FSZ0KG', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'WA25GWM', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'N1UTCLLRD5VJWEHDWBN6', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, 'D4U6ZK8KO3U9N', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (27, '97QPRUTYL', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'BW30ULX2XGPUPLP', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'MA4BF371H1LMWOCJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'XTYF9MP6T4E8C3P2R2VJ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, '99QTL5HHJXO8BAPA55VO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'L8R0R2CPTTN2Z0SQ55BV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'MJJSR96LPHTNMZHIR8REL', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'L49FNMBCD33DD', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'BVTXD071JBIUY', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'OQ3J8K5O6JQ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'HHHDOHAVS0EO2K4RRS04', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'MCD0BZ68ZBOUZ8', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'KHS02Q99V', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'D31Z42Z', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'JYSNDB7QNJ62KFLHS1IME', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'BKWTLRI9EO23T4J63345P', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (28, 'SDUC8HE5XIPW5804', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (29, 'FYRZH2Y0AJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'O17E3BH6NFU', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '45E2D7MV4MJN0', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '32PP76ZK5LEPO1WG09Z', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '4Y6Z9X12', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '04GWNLKR', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '5QQQHCZ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '8GIVGTLBQM6Z7J2D4GEK', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'N02AJ1BU62TVQAV', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'JJNV2CO48TXANYNFBKDI2', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'SANR15W261T', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'FCU04Y3TF63OILE5RSL3', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'NKUPQ7U18D994E', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'BYFDK23N06Y8', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'UEN7FUN', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'SDWAOQL6ECL81FBZGH3Z8', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'Z0ETQEE80W6', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'G1UEQBK09', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '4FQOB', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'V9FI47R25KVSIK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'H8JDI', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '2GOYYZDWAU2NWJXLT', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, '7UGDOWFW37N7HBK', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'A2EPH58ZDGO7J', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'HSBGDO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'UPT1C', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (30, 'EGDFF193GSKZX', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, '8XJNZJMFJI937JIU064', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'R0UDL5T0Q', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, '8JVZWM0IHY17XX', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'C6TPIU7QZ4W3XY9', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'X9QBYBID', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, '7UGDOWFW37N7HBK', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, '7FN4G7FYOI18A2AQVD', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'HK06V2AR', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'NIAUET3FH6CU', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'LGHJM2WK9TCOOI4MJEE', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'LHK0T9S', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'UPT1C', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'CNB4GX0R2UPU', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (31, 'T3RTSEYP98CYC1TYM', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, '1JXH31GX8HUYX0IE83', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'MV6XK', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'N1UTCLLRD5VJWEHDWBN6', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'LFZV37F28', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, '2K7X7R3APTU1FDLSP84', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'R3HEM3T897D8B', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, '85JV1UMUHD0L52HHVV', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'W7SM1', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'CXWEZJ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'DA9GT25X739M1Y0', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'QYJ6CP', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'MK852YS1CMM', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'O8KRDW60J3K0XRHDT6XDT', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, '53F6XOJ1JUIB', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, '6X9Q3TM0S18EFZG7', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'AGCYAE21BNK19H', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'Z0XA0YOXAY6UO10', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'QVA2UM9VYSWZ2VV', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'Z4QYNGYHM7GFKULCOI2UL', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'UVVHVAESPAV8HXMX45', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (32, 'UCVPPZOYXWYY1IQ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, '41UPBXWORKVV7PPAMXM', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, 'C3FREM', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, '7Q5BDZTTRD9ESU2G', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, 'VF0W3NHMB0IO6T627B', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, 'DA9GT25X739M1Y0', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, '62IZOU76V1EPAPZ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, 'L3IIEMC1WYM3W1KGXQ9R1', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, 'AXF6A09GKL6POJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, '3BVQ0WX4BBQRYZ0K3O0R', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, '67IEX5TA4Z39PC', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (33, 'N1UTCLLRD5VJWEHDWBN6', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (34, 'QYYXP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (34, '02C91G77F9S3T', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (34, 'XMMDEQZECUBMWVS8', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (34, 'Q7YGYZ0S40T', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (34, 'YN2SDTYRD0CIJ72KKJK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (34, 'Y2N0RN', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (34, '2I43566IFBO', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'ELM3O84ALTOWXZH9BYT', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, '92RNQOWISW5Y9', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'ASTLCU', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'MUJZQQ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'MQC9YX5NTF169OM1', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, '5QQQHCZ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'M95K5K9QZ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'VPKLW00GUMQ89S7QV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'O17E3BH6NFU', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'YXRFHRLQ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'F56V57VNWTG0PEW', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (35, 'BUE03EPCMK5CN5W86K7', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (36, 'WUUPSVKB6AIT9P8FWBLB2', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, '1OV0H27YQSDB4', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'RRCVTYZQKRRBXM38CN1', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'Z4QYNGYHM7GFKULCOI2UL', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, '85JV1UMUHD0L52HHVV', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'LN0AZUKE0A1TMT3GJ59', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'MQ8F85J465QUJDU4RLTD', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'VNFQD1PRQSES92H', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'XAT20KDG7EMM7', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'Y883RPGH7U', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'Y88JFXE7I41E', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'TJIU0S', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'W7SM1', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, '2CID2PM88ZLMUDAL', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'EHMPBT02NO4LGPA', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'CBMBFZFMGFQQ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'UYZQMXQED8H2TW', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'KHS02Q99V', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'XTKKXBLZZBX93GS', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'WI6YVYO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (37, 'T3RTSEYP98CYC1TYM', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'NB24TDA92', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'JJNV2CO48TXANYNFBKDI2', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'X9QBYBID', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, '7L9KY', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'DA9GT25X739M1Y0', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, '5YXOUQ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'VPKLW00GUMQ89S7QV', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'I0OJ9748', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'XTYF9MP6T4E8C3P2R2VJ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, '7NFADWE0UFFHJAVV', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'IL3GL4T', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'UUSH3D8PB8YBW6Z', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, '86WVI35UB8ONK4BG92', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'R7BSNEKS4IGM4OVIEXLK', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, '56E0F3JOJJDS45YBX1N', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'Y88JFXE7I41E', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'UCVPPZOYXWYY1IQ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, '9DGZDOJSMHYA', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'VMHJQ7O5VWP92VZB2Z', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, 'A9ACTJAH3F', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (38, '288Y1JHE2K', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'L9HEMTXMNU1S8JULJX', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'PLUBPMU7S9ZQ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, '32PP76ZK5LEPO1WG09Z', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'XLVYCBFBC03JVAQG', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, '2SW2XT1PPYX', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, '8HBG25ODWXJT9ECAHI', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'N1UTCLLRD5VJWEHDWBN6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'A2EPH58ZDGO7J', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'Z485XQ48L6M', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, '6ZPFBD41AGJG629ELF', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'S1K5SO8KVT5DEA1', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'MHBKQ5MZ0SH36X', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'WE1Q5UY', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'GFN4N4GWD', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'HK06V2AR', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'BYPLGOFPQMJT', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'HSBGDO', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'EY9BOWO0ONREKII9SYIQG', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'QVA2UM9VYSWZ2VV', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'JWOG2WE8', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'A9ACTJAH3F', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, '9TD3D26HXZKO1G0HIE5', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, '6WMZLW55AV0D86', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'PDC44U9YAF75YQQJG', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (39, 'CDQIS', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'QSP89T0I9JLS', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'GS0MI64', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'GFN4N4GWD', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, '0M2JXDCLZ0', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, '2K7X7R3APTU1FDLSP84', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'JYSNDB7QNJ62KFLHS1IME', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'N55RS7PHXKJZ283K', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, '41UPBXWORKVV7PPAMXM', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'Y3F7W49Z', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'TNQ84HUOAXE', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'MV6XK', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'O0AJGLWV5YIJSHGE3', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, '0I8XSK1UG5C3X', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'MHBKQ5MZ0SH36X', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'MA4BF371H1LMWOCJ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, '5A2HLJ6P', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (40, 'T5TJZ3PWAKO1O3XF', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'VWF8C0OHLIHIST', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'TS0AU', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, '7UGDOWFW37N7HBK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, '90K8LVI', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'UA827GA6WFRTQ2', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'VF3A3D', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'S1E2GSVTJQ8FDCMKRRGI', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'R3HEM3T897D8B', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, '6X9Q3TM0S18EFZG7', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'C2X22WDYBYOD8A1H8X9XC', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'LFZV37F28', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (41, 'XK54KCGLQF9VX01VVB40', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'AJ7OC2KWG', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'KFBBDJ2O', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, '9QH77BNMAK30A6TET3UK', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'HUFMZDU8S', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'EK23AQZCHC1A', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'BDAAVO', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'NZ8EK6Z7CO', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, '85JV1UMUHD0L52HHVV', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'BYFDK23N06Y8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'RRCVTYZQKRRBXM38CN1', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, '981M45J7A6LBAE', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'JVDOL8R', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'LU89A', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'N1UTCLLRD5VJWEHDWBN6', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, '2Z9615JLE2UIDCM7OD', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'WA2I45YB7E6DG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, '9LNGWY5DWNPA51K2', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'KU21KBD7E', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'NB24TDA92', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'WGPHLEQ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, '9TD3D26HXZKO1G0HIE5', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'XMMDEQZECUBMWVS8', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'XPCN0F1R4', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (42, 'GU6848TQ4VA5R', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'SANR15W261T', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'GF4IPWZXNXZNUJM', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, '5PQJ744', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'WA2I45YB7E6DG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'F0U1TA', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'W22SIT2WXELR', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'WDWIEDU09', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, '6MA0OT1J2', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, '699OPJEQ5B20HL07', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'CDQIS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'UYZQMXQED8H2TW', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'MV6XK', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (43, 'G1UEQBK09', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, '2SW2XT1PPYX', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'VF3A3D', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'YUJ72682YR6XBDTDSKH', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, '589SANB', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'GGWXZ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'GU6848TQ4VA5R', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'II6VD1', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, '3EERUKR5EZZUJRL6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'HXQOFUOQ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'Z485XQ48L6M', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'UFILA9KZ2QEMYG76', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'AJ7OC2KWG', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'TS0AU', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'BVTXD071JBIUY', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, '13URU71I0ET52TX', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, '5UYBB7', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'HSBGDO', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, '0MWSLI7P1QKZZ4', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'CYMMQQMYEWRO6CB5XS9P', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'ERZG9X', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'KQSJZL6L31I5BAKXS', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (44, 'P3MGNX9GXNNEJT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (45, '77ATEV', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (46, 'Z485XQ48L6M', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (46, 'V2U95QBAM', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (46, 'ASTLCU', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, 'ELM3O84ALTOWXZH9BYT', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, 'AXF6A09GKL6POJ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, '4FQOB', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, '62IZOU76V1EPAPZ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, 'C4XWVFZ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, '7Q5BDZTTRD9ESU2G', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, '7UGDOWFW37N7HBK', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, 'JU7F89YBYG0OZOFS', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, '0M2JXDCLZ0', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, '5YXOUQ', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, 'XZPVJMYIMHH', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, 'CDQIS', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (47, 'YTT6USN5BCYA', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'D8TJJICNEOV82', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'QYJ6CP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'VPKLW00GUMQ89S7QV', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'VF0W3NHMB0IO6T627B', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'OQ3J8K5O6JQ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, '0BFMVYU3NOGELDTTJC', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, '0I8XSK1UG5C3X', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'FQXWTL', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, '67IEX5TA4Z39PC', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'SJZRNHN', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'JVDOL8R', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'CYMMQQMYEWRO6CB5XS9P', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, '7YNBEF', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (48, 'KZ9U1E2JUS9SMJ6TQ8K', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'KZ9U1E2JUS9SMJ6TQ8K', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, '2ZYIUXLHU7ORABUN6Y', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, '5X84IINRW', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'SGDU4TYC3Z2CTBO02O', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'SCH5S98F9C9FLIBD1QX4', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'ZT29H850LSWEYUZ3SSAZU', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'BUE03EPCMK5CN5W86K7', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'WA25GWM', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'MV6XK', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'LGHJM2WK9TCOOI4MJEE', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, '7UGDOWFW37N7HBK', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, '3C0DV9JO5RS5F', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'ZQA56', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, '5IBBA7O5O7HU08J', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, '3OT4U0OZFD95E9K', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'P3MGNX9GXNNEJT', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'C6TPIU7QZ4W3XY9', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'ET1Q87U38A3MJ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'QCO6X9ETFPG15BL2', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'Y5X3BG429E28TN', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'G1UEQBK09', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'PEVLRHGO05S1XOQFS6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (49, 'PPA2QBF2G', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'C3FREM', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'MJZ47QMOV', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, '6MA0OT1J2', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, '22K2FGBX3B7MGM3D4U', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'HUFMZDU8S', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'O7QS8WMH8LONPN7YJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'LU89A', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, '32PP76ZK5LEPO1WG09Z', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, '23CWHYK', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'J8TFEGSIMBFKBQHXN', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'WE1Q5UY', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'MT9WD29UG1D8JKZXYHBR', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'EA4RXFRYJTRY', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, '2ITL25BIV7E2VW2THO', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'DTJ3FON8UE3D95N4INSF', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, '8XJNZJMFJI937JIU064', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, 'MF44FFETGVBGI2L506L', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (50, '85JV1UMUHD0L52HHVV', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, '66S4EM2P', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, '3EERUKR5EZZUJRL6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, '981M45J7A6LBAE', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'ZD2CRTD', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'KD57F', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'XAT20KDG7EMM7', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'RK0HL3Z5I7CG6Z9SNV8', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'MV6XK', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, '32PP76ZK5LEPO1WG09Z', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'UPT1C', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'EA4RXFRYJTRY', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'MQ8F85J465QUJDU4RLTD', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'NIAUET3FH6CU', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'O8KRDW60J3K0XRHDT6XDT', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'L9HEMTXMNU1S8JULJX', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'O7QS8WMH8LONPN7YJ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'JYSNDB7QNJ62KFLHS1IME', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'DITF47NV9AH76', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'EIJ6PEH88HT81OTQ1', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'KFBBDJ2O', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, '5X84IINRW', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'QCO6X9ETFPG15BL2', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'XLVYCBFBC03JVAQG', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'I0OJ9748', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, '4FQOB', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (51, 'P9K4TFHA36EYQVU', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, 'CIAALP', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, '56E0F3JOJJDS45YBX1N', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, 'EY9BOWO0ONREKII9SYIQG', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, 'HQRQELWCEHW', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, 'WQHR6DBMU6W3IJGNIEXF', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, '8871TAL4EDLF5BCYGA5S', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, 'WI6YVYO', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, 'N55RS7PHXKJZ283K', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, '5IBBA7O5O7HU08J', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, 'XHYK1', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, 'KQSJZL6L31I5BAKXS', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (52, '7L9KY', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, '2Z9615JLE2UIDCM7OD', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'UUSH3D8PB8YBW6Z', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'LHK0T9S', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, '0BFMVYU3NOGELDTTJC', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'AGCYAE21BNK19H', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, '5K4EC6Y', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, '5EHJW01BU2OJ9JKJWAS', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'MBEUPWPIHGRS4FJVF93QF', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'H8JDI', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'UA827GA6WFRTQ2', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'TJIU0S', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'R3HEM3T897D8B', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'JYSNDB7QNJ62KFLHS1IME', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'MV6XK', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'IRJVC7CDJH2UTY011', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, '5YXOUQ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, '7NFADWE0UFFHJAVV', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'Y3F7W49Z', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'TS0AU', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'I0K5BF0XOU8RRWJS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'Z4QYNGYHM7GFKULCOI2UL', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'O8KRDW60J3K0XRHDT6XDT', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'SANR15W261T', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, '3OPK3DH4ZI73RO', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (53, 'D31Z42Z', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'N55RS7PHXKJZ283K', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'WE1Q5UY', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'Y0D4BUL8', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'WVYMG3GV', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'PEVLRHGO05S1XOQFS6', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, '7FN4G7FYOI18A2AQVD', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, '9LNGWY5DWNPA51K2', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'FZ56D1Q7Q', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'S1E2GSVTJQ8FDCMKRRGI', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'RI5SPSRSS1R29UB', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'LYBLSUB7S10666J6VJOCJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'MCD0BZ68ZBOUZ8', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'B732DEO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'UVVHVAESPAV8HXMX45', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'JWOG2WE8', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'EA4RXFRYJTRY', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, '6ZPFBD41AGJG629ELF', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'X9QBYBID', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (54, 'Z5OJ6ZTHT1O76CHLG9', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, '8GIVGTLBQM6Z7J2D4GEK', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'VWF8C0OHLIHIST', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, '6WMZLW55AV0D86', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'EY9BOWO0ONREKII9SYIQG', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, '2ITL25BIV7E2VW2THO', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'WE1Q5UY', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'CNB4GX0R2UPU', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'XZPVJMYIMHH', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'V2U95QBAM', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'TZYP10H0544', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, '0J7QVKSSD', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'MT9WD29UG1D8JKZXYHBR', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'N6S5S0', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'Y88JFXE7I41E', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, 'TS0AU', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (55, '13URU71I0ET52TX', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (56, 'WE1Q5UY', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (56, 'IKPREAG', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (56, 'SCH5S98F9C9FLIBD1QX4', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (56, 'Q7YGYZ0S40T', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (56, 'Y3F7W49Z', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, 'VMHJQ7O5VWP92VZB2Z', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, '8XJNZJMFJI937JIU064', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, 'UPT1C', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, '6V4B2UHOK5ZM1OWYE8MV', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, 'KU21KBD7E', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, '30OR6SWDE690', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, '6Q3GO4LPZG2E8LZQ7DUXY', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, 'X9QBYBID', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, 'KZ9U1E2JUS9SMJ6TQ8K', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (57, 'KRTZOJ6JKK3X7ZM', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'C2X22WDYBYOD8A1H8X9XC', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'BUE03EPCMK5CN5W86K7', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, '288Y1JHE2K', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, '3X7PR3QB8KHLPUC2Z', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'JWOG2WE8', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, '4L1DW5PKXJ55', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'GFN4N4GWD', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, '2MS0C07CGKTC2', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, '77ATEV', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'WGPHLEQ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'IVT7I9WFUVYNTDK', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'Z5OJ6ZTHT1O76CHLG9', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'NZ8EK6Z7CO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'MQC9YX5NTF169OM1', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'CWO0WGF5R', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, '4BQVNNGVBJ7GK5W121', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, '5PQJ744', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (58, 'TZYP10H0544', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'EHMPBT02NO4LGPA', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'CUQUP009JQLD4ZRBZS', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'MA4BF371H1LMWOCJ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'BYPLGOFPQMJT', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, '90K8LVI', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'YTT6USN5BCYA', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'CXWEZJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'SDUC8HE5XIPW5804', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'PLUBPMU7S9ZQ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'WDWIEDU09', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'B6L7BDOA', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, '5X84IINRW', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'DITF47NV9AH76', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'WUUPSVKB6AIT9P8FWBLB2', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'MCD0BZ68ZBOUZ8', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, '4HUT9MXQB8PGY2KBAL', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, 'DX04DLJ1O', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (59, '7UGDOWFW37N7HBK', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'YXRFHRLQ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, '699OPJEQ5B20HL07', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'C6TPIU7QZ4W3XY9', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'OWP3D0V', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'N6S5S0', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'W22SIT2WXELR', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'ELM3O84ALTOWXZH9BYT', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'HK06V2AR', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'S1K5SO8KVT5DEA1', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, '32PP76ZK5LEPO1WG09Z', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, '36T1VGU3G0LYF', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'VF3A3D', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, '07GN343YO8ISA6', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, '22K2FGBX3B7MGM3D4U', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'AQ2LR5R14I', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'RRCVTYZQKRRBXM38CN1', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'WGPHLEQ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (60, 'T3RTSEYP98CYC1TYM', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, '62IZOU76V1EPAPZ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'BUE03EPCMK5CN5W86K7', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, '07GN343YO8ISA6', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, '2ITL25BIV7E2VW2THO', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'JWOG2WE8', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, '92RNQOWISW5Y9', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'MHBKQ5MZ0SH36X', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'Z485XQ48L6M', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'UXHLXFZRSKO', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'M95K5K9QZ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'MK852YS1CMM', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'UUSH3D8PB8YBW6Z', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'R0UDL5T0Q', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'ET1Q87U38A3MJ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, '2MS0C07CGKTC2', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'D4U6ZK8KO3U9N', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, '27MCUEOD4FUNSK', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, '3QM188FD73U', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'TZYP10H0544', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'BYPLGOFPQMJT', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (61, 'V2U95QBAM', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (62, 'GGWXZ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (62, 'HQRQELWCEHW', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (62, 'QYJ6CP', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (62, '2BSZUM5KAOR9G5GXMZ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (62, '7ZNIARN4KATYPLOR', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (62, '2FMUFGLRHDZUFPYQ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (63, 'BYPLGOFPQMJT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (63, '53F6XOJ1JUIB', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (64, '2IS59RXMJQH6K', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (64, 'YXRFHRLQ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (64, '9LNGWY5DWNPA51K2', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (64, 'MKO9QET3HY7P', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (64, 'PEVLRHGO05S1XOQFS6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (64, '2K7X7R3APTU1FDLSP84', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (65, 'NKUPQ7U18D994E', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (65, 'RK0HL3Z5I7CG6Z9SNV8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '13URU71I0ET52TX', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'B6L7BDOA', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'O8UDLDAO', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'X6W6X5GILAJ2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '2IS59RXMJQH6K', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '53F6XOJ1JUIB', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'KZ9U1E2JUS9SMJ6TQ8K', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'W4GWGW5T9D8MKGC23', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'CUQUP009JQLD4ZRBZS', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '57VGLO', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '77ATEV', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'NS1I9XWC', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'T5TJZ3PWAKO1O3XF', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'MCD0BZ68ZBOUZ8', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '67FYTY9BLZIR', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'WA25GWM', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'CBMBFZFMGFQQ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '04GWNLKR', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'GGWXZ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'APVBWS1XK7E', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'CIAALP', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '8XJNZJMFJI937JIU064', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'PH7NZ3', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, 'JJNV2CO48TXANYNFBKDI2', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (66, '41UPBXWORKVV7PPAMXM', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, '2K7X7R3APTU1FDLSP84', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, '5PQJ744', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, '45E2D7MV4MJN0', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'KU21KBD7E', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'QSP89T0I9JLS', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, '21UGUUBNP1', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'XMMDEQZECUBMWVS8', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'V9FI47R25KVSIK', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'VNFQD1PRQSES92H', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'WQHR6DBMU6W3IJGNIEXF', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'EY9BOWO0ONREKII9SYIQG', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'WVYMG3GV', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, '7NFADWE0UFFHJAVV', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'QQEYO7KC8BSL5FJ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, '07GN343YO8ISA6', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'NZ8EK6Z7CO', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'MKO9QET3HY7P', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'OVM4J', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'UUSH3D8PB8YBW6Z', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'WUUPSVKB6AIT9P8FWBLB2', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (67, 'MUJZQQ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (68, 'M70ZQD6N2FJQ1OJA', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (68, 'D8TJJICNEOV82', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (68, 'XTKKXBLZZBX93GS', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (68, '5FKZ5E1M87QESJ30Q', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (68, 'C4D6Z4B', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (68, 'AXF6A09GKL6POJ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (68, 'VI9T9PFU02Y4M3P3PUUPE', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (68, '04GWNLKR', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'VI9T9PFU02Y4M3P3PUUPE', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'Y883RPGH7U', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'LU89A', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'Y0D4BUL8', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'FZ56D1Q7Q', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, '1OV0H27YQSDB4', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'UUSH3D8PB8YBW6Z', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'C3FREM', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'UEN7FUN', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'YN2SDTYRD0CIJ72KKJK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, 'AQ2LR5R14I', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (69, '02C91G77F9S3T', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (70, 'N6S5S0', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (70, '7SPGQCTJ83R7DVZD', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (70, 'L8R0R2CPTTN2Z0SQ55BV', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (70, '53F6XOJ1JUIB', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (70, 'T5TJZ3PWAKO1O3XF', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (70, 'WDWIEDU09', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (71, 'P9K4TFHA36EYQVU', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, '5X84IINRW', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'G1UEQBK09', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, '4BQVNNGVBJ7GK5W121', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'MT9WD29UG1D8JKZXYHBR', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'KQSJZL6L31I5BAKXS', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, '2BSZUM5KAOR9G5GXMZ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'BVTXD071JBIUY', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'PLUBPMU7S9ZQ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'YXRFHRLQ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, '5YJUXY2VSUV5XI5G3DIZ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, '769C58JH910T5GZCLRT', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'T5TJZ3PWAKO1O3XF', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'O8UDLDAO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'CZFJ09QE', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'LHK0T9S', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'RK0HL3Z5I7CG6Z9SNV8', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, '5A2HLJ6P', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'J8TFEGSIMBFKBQHXN', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'ETUSGK66QD61ZH3WOP8R', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, '0J7QVKSSD', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (72, 'MQ8F85J465QUJDU4RLTD', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (73, '9QH77BNMAK30A6TET3UK', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (73, 'AGCYAE21BNK19H', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'MKO9QET3HY7P', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'S1E2GSVTJQ8FDCMKRRGI', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'Y88JFXE7I41E', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'O8KRDW60J3K0XRHDT6XDT', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'CZFJ09QE', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'CWO0WGF5R', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, '5X84IINRW', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'DTJ3FON8UE3D95N4INSF', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'O7QS8WMH8LONPN7YJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'N55RS7PHXKJZ283K', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'XPCN0F1R4', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'J5C70PD4F9807NC5', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'NIAUET3FH6CU', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'MLERQAU3CZW9Y3C', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'DITF47NV9AH76', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'QCO6X9ETFPG15BL2', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (74, 'WDWIEDU09', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'WGPHLEQ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, '0M2JXDCLZ0', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'V2U95QBAM', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'GGWXZ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'CUQUP009JQLD4ZRBZS', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'QSP89T0I9JLS', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'O0AJGLWV5YIJSHGE3', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, '3QM188FD73U', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'ZGDI8EJIXNAIHAUG0V', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'VF3A3D', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'RSO05ATN6DZQ9I', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, '56E0F3JOJJDS45YBX1N', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'I0OJ9748', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'FIIVD9380IDSKURUJ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, '2GOYYZDWAU2NWJXLT', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, '1AHOY', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'OQ3J8K5O6JQ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'KQSJZL6L31I5BAKXS', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (75, 'TNQ84HUOAXE', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'H8JDI', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '3QM188FD73U', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'KFBBDJ2O', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'VBMSWQECXWSDL7J', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'D5X3JMCXX', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'L3IIEMC1WYM3W1KGXQ9R1', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '62IZOU76V1EPAPZ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '5K4EC6Y', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'XAT20KDG7EMM7', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '0BFMVYU3NOGELDTTJC', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '981M45J7A6LBAE', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'Y2Y239JDBZL66K3', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '7NFADWE0UFFHJAVV', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'MJJSR96LPHTNMZHIR8REL', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '56E0F3JOJJDS45YBX1N', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'WVYMG3GV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'CUQUP009JQLD4ZRBZS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '3BVQ0WX4BBQRYZ0K3O0R', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'UPT1C', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '67IEX5TA4Z39PC', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'M79CEQBO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'NIAUET3FH6CU', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'UYZQMXQED8H2TW', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, 'T2U50QCMRBF6F1275GCO5', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (76, '2K7X7R3APTU1FDLSP84', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (77, '3EERUKR5EZZUJRL6', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (77, 'CIAALP', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, '5A2HLJ6P', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'RI5SPSRSS1R29UB', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'XK54KCGLQF9VX01VVB40', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, '77ATEV', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'RGSP8Y', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, '30OR6SWDE690', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'LYBLSUB7S10666J6VJOCJ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, '22K2FGBX3B7MGM3D4U', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'MJZ47QMOV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'WUUPSVKB6AIT9P8FWBLB2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'OWP3D0V', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'FNJP0CUCSX2G282D26L58', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, '3OPK3DH4ZI73RO', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'L9HEMTXMNU1S8JULJX', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'APVBWS1XK7E', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'NZ8EK6Z7CO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (78, 'PRBQVB3CP8C', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, 'LGHJM2WK9TCOOI4MJEE', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, '6OAUBOFNMM4799S88V', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, '3QM188FD73U', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, '85JV1UMUHD0L52HHVV', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, 'MCD0BZ68ZBOUZ8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, 'VI9T9PFU02Y4M3P3PUUPE', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, 'GVU0CP56W22SHL', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, '699OPJEQ5B20HL07', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, 'XHYK1', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, '5A2HLJ6P', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, 'DLTZVZJ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (79, '6D6JIDJKU2CCLYW', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'QQEYO7KC8BSL5FJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '36T1VGU3G0LYF', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'MJJSR96LPHTNMZHIR8REL', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'SJZRNHN', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '1S7WS7PKONTWYWX4', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'VPKLW00GUMQ89S7QV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '9TD3D26HXZKO1G0HIE5', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '2GOYYZDWAU2NWJXLT', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '2Z9615JLE2UIDCM7OD', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'FFL7CRM9T1TUNA4A3JK0', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '6X9Q3TM0S18EFZG7', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '5ZAB582F4YY0U37NG6P', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'EGDFF193GSKZX', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'X6W6X5GILAJ2', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '6MA0OT1J2', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '7NFADWE0UFFHJAVV', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'Y2Y239JDBZL66K3', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'Y3F7W49Z', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'DX04DLJ1O', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'O0AJGLWV5YIJSHGE3', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, '4L1DW5PKXJ55', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'L1XOEG68Y1O9P', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (80, 'JYSNDB7QNJ62KFLHS1IME', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (81, '2SW2XT1PPYX', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (81, 'GVU0CP56W22SHL', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (81, 'RI5SPSRSS1R29UB', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (81, 'ILQNSNAUOE8', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (81, '13URU71I0ET52TX', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (81, 'MQC9YX5NTF169OM1', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (81, '0I8XSK1UG5C3X', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'EA4RXFRYJTRY', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'TS0AU', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'T5TJZ3PWAKO1O3XF', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, '2228EKDSEF', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'XPCN0F1R4', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'UEN7FUN', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, '2K7X7R3APTU1FDLSP84', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, '5QQQHCZ', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'HQRQELWCEHW', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'HSBGDO', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'PEVLRHGO05S1XOQFS6', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'FIIVD9380IDSKURUJ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'G1UEQBK09', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'CNB4GX0R2UPU', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'P3MGNX9GXNNEJT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'IKPREAG', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'J5C70PD4F9807NC5', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, '57VGLO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'NB24TDA92', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, 'II6VD1', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (82, '2CID2PM88ZLMUDAL', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (83, 'VF0W3NHMB0IO6T627B', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (83, 'XTYF9MP6T4E8C3P2R2VJ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (83, 'MK852YS1CMM', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (83, 'VF3A3D', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (83, 'AGCYAE21BNK19H', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (83, '6OAUBOFNMM4799S88V', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'M95K5K9QZ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'MBEUPWPIHGRS4FJVF93QF', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'QIO1AG64EYG02PKZEF6', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'ET1Q87U38A3MJ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'SGDU4TYC3Z2CTBO02O', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'FQXWTL', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'CWO0WGF5R', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'WK8M1SJJ5IRDHDS', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'Y5X3BG429E28TN', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'WGPHLEQ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'ETUSGK66QD61ZH3WOP8R', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'U9DHEPXBH4CDB', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'C4XWVFZ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'AQ2LR5R14I', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (84, 'B5B2RB', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (85, '99QTL5HHJXO8BAPA55VO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (85, 'O17E3BH6NFU', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (85, 'R3HEM3T897D8B', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (85, 'SGDU4TYC3Z2CTBO02O', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'APVBWS1XK7E', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'IP6EQZ7C4XWJFW4CF6', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'YUJ72682YR6XBDTDSKH', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, '769C58JH910T5GZCLRT', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'C6TPIU7QZ4W3XY9', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, '4L1DW5PKXJ55', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, '2ZYIUXLHU7ORABUN6Y', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'BW30ULX2XGPUPLP', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, '5A2HLJ6P', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'MT9WD29UG1D8JKZXYHBR', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'C4D6Z4B', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'MVO34C', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, '2ITL25BIV7E2VW2THO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, '07GN343YO8ISA6', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'BYFDK23N06Y8', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, '0J7QVKSSD', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, '6V4B2UHOK5ZM1OWYE8MV', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'II6VD1', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'KU21KBD7E', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (86, 'LHK0T9S', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'Z0ETQEE80W6', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'VMHJQ7O5VWP92VZB2Z', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'EQ8GW', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'N1UTCLLRD5VJWEHDWBN6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'X6W6X5GILAJ2', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'HUFMZDU8S', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, '2CID2PM88ZLMUDAL', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'F0U1TA', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'Y0D4BUL8', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, '6MA0OT1J2', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, '949BZO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'MJZ47QMOV', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'GVU0CP56W22SHL', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'OWP3D0V', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, '85JV1UMUHD0L52HHVV', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'YTT6USN5BCYA', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, 'AXF6A09GKL6POJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (87, '97N27TIYC', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (88, 'EIJ6PEH88HT81OTQ1', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'PEVLRHGO05S1XOQFS6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, '7YNBEF', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'SANR15W261T', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'MUJZQQ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, '2FMUFGLRHDZUFPYQ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'RI5SPSRSS1R29UB', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'MJZ47QMOV', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'WSZK32VL95', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'DITF47NV9AH76', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, '3EERUKR5EZZUJRL6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'D4U6ZK8KO3U9N', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'TNQ84HUOAXE', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, '6OAUBOFNMM4799S88V', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, '7NFADWE0UFFHJAVV', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, '699OPJEQ5B20HL07', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'A2EPH58ZDGO7J', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'CBMBFZFMGFQQ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'R0UDL5T0Q', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'F56V57VNWTG0PEW', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'BYPLGOFPQMJT', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (89, 'KHS02Q99V', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '5UYBB7', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '0MWSLI7P1QKZZ4', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '9GSJMDS78HQN', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'EA4RXFRYJTRY', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'KFBBDJ2O', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '62IZOU76V1EPAPZ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'EIJ6PEH88HT81OTQ1', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'ERZG9X', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'MQ8F85J465QUJDU4RLTD', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '90K8LVI', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'LGHJM2WK9TCOOI4MJEE', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'UUSH3D8PB8YBW6Z', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '4ASMEMPZMUTTPV', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '7FN4G7FYOI18A2AQVD', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '288Y1JHE2K', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'WQHR6DBMU6W3IJGNIEXF', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'L14HL58UR82FUOI629TZJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'WVYMG3GV', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'UXHLXFZRSKO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'R7BSNEKS4IGM4OVIEXLK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'XPCN0F1R4', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'XAT20KDG7EMM7', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, 'CBMBFZFMGFQQ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (90, '13URU71I0ET52TX', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'LGHJM2WK9TCOOI4MJEE', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, '5EHJW01BU2OJ9JKJWAS', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'QCO6X9ETFPG15BL2', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'O0AJGLWV5YIJSHGE3', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'T3RTSEYP98CYC1TYM', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'MT9WD29UG1D8JKZXYHBR', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, '0J7QVKSSD', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'WA25GWM', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, '8871TAL4EDLF5BCYGA5S', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'DA9GT25X739M1Y0', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'RRCVTYZQKRRBXM38CN1', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, '5PQJ744', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, '56E0F3JOJJDS45YBX1N', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'FFL7CRM9T1TUNA4A3JK0', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'TNQ84HUOAXE', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, '2I43566IFBO', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'PINOPOLHDJHEK', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (91, 'CJ8GR5XGB9XNXCW4LKME', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'HQRQELWCEHW', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'Y0D4BUL8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'JWOG2WE8', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'C2X22WDYBYOD8A1H8X9XC', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'MKO9QET3HY7P', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'P9K4TFHA36EYQVU', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'FZ56D1Q7Q', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'HK06V2AR', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'HUFMZDU8S', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '0M2JXDCLZ0', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '85JV1UMUHD0L52HHVV', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '5A2HLJ6P', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'HHHDOHAVS0EO2K4RRS04', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'M79CEQBO', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'RAONEMJLR17H5', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'EY9BOWO0ONREKII9SYIQG', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '4FQOB', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '9LNGWY5DWNPA51K2', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'QVA2UM9VYSWZ2VV', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'JRQQAAGBDRKLHTRGH7', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '32KLYLHKPTARYNOX44RGW', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '66S4EM2P', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'KHS02Q99V', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, 'WDWIEDU09', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '90K8LVI', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (92, '97QPRUTYL', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'KD57F', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'IKPREAG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'B6L7BDOA', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, '23CWHYK', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'V9FI47R25KVSIK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'Y88JFXE7I41E', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'SCH5S98F9C9FLIBD1QX4', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, '97N27TIYC', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'H8JDI', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'SJZRNHN', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'M79CEQBO', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, '56E0F3JOJJDS45YBX1N', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'HHHDOHAVS0EO2K4RRS04', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'QQEYO7KC8BSL5FJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'WPF946Y2FHYCJCVBZ5DS', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'L49FNMBCD33DD', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'D5X3JMCXX', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, '7NFADWE0UFFHJAVV', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'XTKKXBLZZBX93GS', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'WUUPSVKB6AIT9P8FWBLB2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, 'Z0ETQEE80W6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, '5EHJW01BU2OJ9JKJWAS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (93, '77ATEV', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, 'W4GWGW5T9D8MKGC23', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, '5FKZ5E1M87QESJ30Q', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, 'NIAUET3FH6CU', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, 'D4PEN3PQOBHRL', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, 'V9FI47R25KVSIK', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, 'MF44FFETGVBGI2L506L', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, '8HBG25ODWXJT9ECAHI', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, '3TGKD7HO9EKV69R0UIP', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, '8871TAL4EDLF5BCYGA5S', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, 'QSP89T0I9JLS', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, '7YNBEF', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, '020UJRJD', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (94, '6OAUBOFNMM4799S88V', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, '5X84IINRW', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'XTYF9MP6T4E8C3P2R2VJ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, '86WVI35UB8ONK4BG92', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, '13URU71I0ET52TX', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'Y88JFXE7I41E', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'RRCVTYZQKRRBXM38CN1', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'D4U6ZK8KO3U9N', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'BYFDK23N06Y8', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, '6WMZLW55AV0D86', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'LU89A', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'WV8XBDGHNU2CT6SY', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, '7FN4G7FYOI18A2AQVD', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, '5YJUXY2VSUV5XI5G3DIZ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'FYRZH2Y0AJ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'PLUBPMU7S9ZQ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, '1AHOY', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (95, 'ERZG9X', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (96, 'MJZ47QMOV', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (96, 'WQHR6DBMU6W3IJGNIEXF', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (96, '6Q3GO4LPZG2E8LZQ7DUXY', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, '1JXH31GX8HUYX0IE83', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, '5A2HLJ6P', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, 'SGDU4TYC3Z2CTBO02O', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, 'CIAALP', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, 'B5B2RB', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, 'XLVYCBFBC03JVAQG', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, 'Z485XQ48L6M', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, '3QM188FD73U', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, '9QH77BNMAK30A6TET3UK', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, '56E0F3JOJJDS45YBX1N', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (97, 'JJNV2CO48TXANYNFBKDI2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (98, '7NFADWE0UFFHJAVV', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (98, 'FNJP0CUCSX2G282D26L58', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (98, 'M79CEQBO', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (98, 'BDAAVO', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (98, 'T43XM4QIZMCXKVUXFLYB', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (98, 'IRJVC7CDJH2UTY011', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (98, 'W22SIT2WXELR', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'LU89A', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'S1K5SO8KVT5DEA1', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'XK54KCGLQF9VX01VVB40', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, '97QPRUTYL', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'HQRQELWCEHW', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'PRBQVB3CP8C', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'QCO6X9ETFPG15BL2', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'ZQA56', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, '3V23HB1NVU3YG8XT3A', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, '2C67F990PDFNMH2KND', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, '288Y1JHE2K', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, '66S4EM2P', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'IVT7I9WFUVYNTDK', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'BHOXCIQ5EP4DJ34JF6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'Y88JFXE7I41E', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'Z485XQ48L6M', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'SCH5S98F9C9FLIBD1QX4', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'UEN7FUN', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, '2ITL25BIV7E2VW2THO', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'XTKKXBLZZBX93GS', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'C2X22WDYBYOD8A1H8X9XC', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, '90K8LVI', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (99, 'KZ9U1E2JUS9SMJ6TQ8K', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (100, 'PWJQE', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (100, '90K8LVI', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (100, '949BZO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (100, 'VMHJQ7O5VWP92VZB2Z', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (100, 'BHOXCIQ5EP4DJ34JF6', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (100, '769C58JH910T5GZCLRT', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (100, 'MJJSR96LPHTNMZHIR8REL', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, '7ZNIARN4KATYPLOR', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'KRTZOJ6JKK3X7ZM', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'AJ7OC2KWG', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'XTKKXBLZZBX93GS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'QCO6X9ETFPG15BL2', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'ZGDI8EJIXNAIHAUG0V', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'FYRZH2Y0AJ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, '13URU71I0ET52TX', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'VWF8C0OHLIHIST', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, '57VGLO', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, '9LNGWY5DWNPA51K2', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, '3X7PR3QB8KHLPUC2Z', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'NS1I9XWC', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'JRQQAAGBDRKLHTRGH7', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, '8871TAL4EDLF5BCYGA5S', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'B732DEO', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'HXQOFUOQ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, '7UGDOWFW37N7HBK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, '769C58JH910T5GZCLRT', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'YN2SDTYRD0CIJ72KKJK', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'L14HL58UR82FUOI629TZJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'IL3GL4T', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'RI5SPSRSS1R29UB', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (101, 'W7SM1', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, 'WK8M1SJJ5IRDHDS', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, 'SJZRNHN', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, 'KQSJZL6L31I5BAKXS', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, 'EK23AQZCHC1A', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, 'LN0AZUKE0A1TMT3GJ59', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, 'J8TFEGSIMBFKBQHXN', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, '4FQOB', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, '981M45J7A6LBAE', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, '53F6XOJ1JUIB', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, 'WVYMG3GV', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, '2CID2PM88ZLMUDAL', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, '5A2HLJ6P', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, '2SW2XT1PPYX', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (102, 'X6W6X5GILAJ2', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'ILQNSNAUOE8', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '4BQVNNGVBJ7GK5W121', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'R0UDL5T0Q', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'LFZV37F28', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'KRTZOJ6JKK3X7ZM', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'NS1I9XWC', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '2KEDWE', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'DA9GT25X739M1Y0', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '5K4EC6Y', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'O0AJGLWV5YIJSHGE3', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '36T1VGU3G0LYF', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'D8TJJICNEOV82', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'GF4IPWZXNXZNUJM', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'XTYF9MP6T4E8C3P2R2VJ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '2Z9615JLE2UIDCM7OD', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '6WMZLW55AV0D86', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'ELM3O84ALTOWXZH9BYT', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '8JVZWM0IHY17XX', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'UQ0M7JMGK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'J5C70PD4F9807NC5', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '7ZNIARN4KATYPLOR', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, '04GWNLKR', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (103, 'CUQUP009JQLD4ZRBZS', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'N1CTQN1AEDWM04Q00', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, '9DGZDOJSMHYA', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'PLUBPMU7S9ZQ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'WSZK32VL95', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, '3OT4U0OZFD95E9K', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'XZPVJMYIMHH', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'SJZRNHN', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'IKPREAG', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'C3FREM', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, '9LNGWY5DWNPA51K2', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'FYRZH2Y0AJ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'MKO9QET3HY7P', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'RSO05ATN6DZQ9I', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'XK54KCGLQF9VX01VVB40', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'WA2I45YB7E6DG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, '21UGUUBNP1', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'QIO1AG64EYG02PKZEF6', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'FQXWTL', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, '66S4EM2P', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'PINOPOLHDJHEK', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'VF0W3NHMB0IO6T627B', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'D4U6ZK8KO3U9N', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'BHOXCIQ5EP4DJ34JF6', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'KFBBDJ2O', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (104, 'OVM4J', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'ET1Q87U38A3MJ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'MA4BF371H1LMWOCJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'LU89A', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, '07GN343YO8ISA6', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'N6S5S0', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'Y88JFXE7I41E', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, '0I8XSK1UG5C3X', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, '21UGUUBNP1', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'Z00K1Q', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, '56E0F3JOJJDS45YBX1N', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, '5IBBA7O5O7HU08J', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'GGWXZ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'CWO0WGF5R', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'L9HEMTXMNU1S8JULJX', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, '99QTL5HHJXO8BAPA55VO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'ERZG9X', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'C4D6Z4B', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'II6VD1', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'ILQNSNAUOE8', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'T43XM4QIZMCXKVUXFLYB', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'O8UDLDAO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'BH5BATRJWJY', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (105, 'AJ7OC2KWG', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'XAT20KDG7EMM7', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'ET1Q87U38A3MJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'S1E2GSVTJQ8FDCMKRRGI', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, '0MWSLI7P1QKZZ4', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, '5K4EC6Y', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'UA827GA6WFRTQ2', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'LHK0T9S', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, '3HHJP2PO2PP', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'BDAAVO', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'T5TJZ3PWAKO1O3XF', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'CXWEZJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'CIAALP', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'SDUC8HE5XIPW5804', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'CNB4GX0R2UPU', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, '1XSJFSKVS6C8', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, '0BFMVYU3NOGELDTTJC', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (106, 'WA25GWM', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'EIJ6PEH88HT81OTQ1', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'CZFJ09QE', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'D4PEN3PQOBHRL', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, '8XJNZJMFJI937JIU064', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'D5X3JMCXX', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'UDWHX1O6B', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'IRJVC7CDJH2UTY011', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, '9LNGWY5DWNPA51K2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, '8JVZWM0IHY17XX', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, '23CWHYK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'WSZK32VL95', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'PPA2QBF2G', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'WGPHLEQ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'WI6YVYO', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'CUQUP009JQLD4ZRBZS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, '3TGKD7HO9EKV69R0UIP', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'F56V57VNWTG0PEW', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'BW30ULX2XGPUPLP', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (107, 'Z00K1Q', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'FT2JICD6YB8PA4B', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'GFN4N4GWD', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, '7ZNIARN4KATYPLOR', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'B732DEO', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'EHMPBT02NO4LGPA', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'MQC9YX5NTF169OM1', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, '7Q5BDZTTRD9ESU2G', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'CBMBFZFMGFQQ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'U9DHEPXBH4CDB', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'JJNV2CO48TXANYNFBKDI2', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (108, 'L9HEMTXMNU1S8JULJX', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, 'IRJVC7CDJH2UTY011', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, '1S7WS7PKONTWYWX4', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, 'B732DEO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, 'NIAUET3FH6CU', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, 'Z4QYNGYHM7GFKULCOI2UL', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, '7UGDOWFW37N7HBK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, '6V4B2UHOK5ZM1OWYE8MV', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, 'CIAALP', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (109, '32KLYLHKPTARYNOX44RGW', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'JVDOL8R', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'IKPREAG', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, '3BVQ0WX4BBQRYZ0K3O0R', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'J5C70PD4F9807NC5', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'Y2Y4H', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'WUUPSVKB6AIT9P8FWBLB2', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'EUEXHHLN3DBDUWM7', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, '5X84IINRW', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'L14HL58UR82FUOI629TZJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'WGPHLEQ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, '9LNGWY5DWNPA51K2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, '67IEX5TA4Z39PC', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'XLVYCBFBC03JVAQG', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'HUFMZDU8S', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'NZ8EK6Z7CO', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (110, 'GFN4N4GWD', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'M79CEQBO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'D4U6ZK8KO3U9N', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'PLUBPMU7S9ZQ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'ZGDI8EJIXNAIHAUG0V', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'AXF6A09GKL6POJ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, '5FKZ5E1M87QESJ30Q', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'FQXWTL', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, '1JXH31GX8HUYX0IE83', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'EQ8GW', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'CXWEZJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, '2GOYYZDWAU2NWJXLT', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, '5IBBA7O5O7HU08J', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'KZ9U1E2JUS9SMJ6TQ8K', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'NB24TDA92', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'VI9T9PFU02Y4M3P3PUUPE', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, 'KRTZOJ6JKK3X7ZM', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (111, '2ITL25BIV7E2VW2THO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'OOCLVBBZCZIG', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, '3HHJP2PO2PP', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'PWJQE', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'WGPHLEQ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, '67IEX5TA4Z39PC', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'ZCDOKYIXEJ7UHB0WXVT', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'MLERQAU3CZW9Y3C', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'RSO05ATN6DZQ9I', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, '4FQOB', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'X6W6X5GILAJ2', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'UVVHVAESPAV8HXMX45', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, '7Q5BDZTTRD9ESU2G', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'LN0AZUKE0A1TMT3GJ59', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'HK06V2AR', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'C4XWVFZ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, '77ATEV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'HXQOFUOQ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'B5B2RB', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'H8JDI', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, '5YJUXY2VSUV5XI5G3DIZ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, '2228EKDSEF', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, 'P8YT53FSZ0KG', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (112, '7L9KY', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (113, 'WQHR6DBMU6W3IJGNIEXF', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (113, 'VBMSWQECXWSDL7J', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (113, '1JXH31GX8HUYX0IE83', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (113, 'DTJ3FON8UE3D95N4INSF', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (113, '2CID2PM88ZLMUDAL', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (113, 'N55RS7PHXKJZ283K', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (113, 'UUSH3D8PB8YBW6Z', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (113, 'VI9T9PFU02Y4M3P3PUUPE', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, 'VF3A3D', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, 'ETUSGK66QD61ZH3WOP8R', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, '8JVZWM0IHY17XX', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, '77ATEV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, 'VMHJQ7O5VWP92VZB2Z', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, 'WDWIEDU09', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, 'D31Z42Z', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, 'ASTLCU', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, '56E0F3JOJJDS45YBX1N', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, 'O7QS8WMH8LONPN7YJ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (114, 'JVDOL8R', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (115, 'NB24TDA92', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (115, 'TJIU0S', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (115, 'LHK0T9S', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (115, 'V9FI47R25KVSIK', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (116, 'B732DEO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (116, 'MQC9YX5NTF169OM1', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (116, 'HUFMZDU8S', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (116, 'DTJ3FON8UE3D95N4INSF', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (116, 'WUUPSVKB6AIT9P8FWBLB2', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (116, 'ZQA56', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (117, '77ATEV', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (117, 'AJ92P9GU71', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (117, '27MCUEOD4FUNSK', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'F0U1TA', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'EQ8GW', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, '0I8XSK1UG5C3X', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'D8TJJICNEOV82', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'TJIU0S', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, '97N27TIYC', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'DX04DLJ1O', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'XTYF9MP6T4E8C3P2R2VJ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, '3X7PR3QB8KHLPUC2Z', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'CZFJ09QE', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'A9ACTJAH3F', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, '85JV1UMUHD0L52HHVV', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, '6V4B2UHOK5ZM1OWYE8MV', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (118, 'Y0D4BUL8', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (119, 'A2EPH58ZDGO7J', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (119, 'ZGDI8EJIXNAIHAUG0V', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (120, 'Y2N0RN', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (120, 'PLUBPMU7S9ZQ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, '99QTL5HHJXO8BAPA55VO', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, '3BVQ0WX4BBQRYZ0K3O0R', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'RGSP8Y', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'MVO34C', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'CIAALP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'ZD2CRTD', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'Y0D4BUL8', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'PWJQE', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'FFL7CRM9T1TUNA4A3JK0', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'LYBLSUB7S10666J6VJOCJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'N55RS7PHXKJZ283K', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'CNB4GX0R2UPU', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'HHHDOHAVS0EO2K4RRS04', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'F0U1TA', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'C2X22WDYBYOD8A1H8X9XC', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'SGDU4TYC3Z2CTBO02O', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, '66S4EM2P', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'U9DHEPXBH4CDB', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'MCD0BZ68ZBOUZ8', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, '6D6JIDJKU2CCLYW', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (121, 'GF4IPWZXNXZNUJM', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (122, 'GGWXZ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (122, 'APVBWS1XK7E', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (122, 'QYYXP', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (122, 'EHMPBT02NO4LGPA', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (122, 'A2EPH58ZDGO7J', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (122, 'RGSP8Y', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'IKPREAG', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'GVU0CP56W22SHL', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'WUUPSVKB6AIT9P8FWBLB2', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, '981M45J7A6LBAE', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'V9FI47R25KVSIK', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'HQRQELWCEHW', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'L9HEMTXMNU1S8JULJX', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'UEN7FUN', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'O8KRDW60J3K0XRHDT6XDT', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (123, 'ZD2CRTD', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, '9LNGWY5DWNPA51K2', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'MBEUPWPIHGRS4FJVF93QF', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'KD57F', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, '4HUT9MXQB8PGY2KBAL', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, '5A2HLJ6P', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'P8YT53FSZ0KG', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'CBMBFZFMGFQQ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'XHYK1', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'M20NJW31JND', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'FCU04Y3TF63OILE5RSL3', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'FIIVD9380IDSKURUJ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'QIO1AG64EYG02PKZEF6', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, '6LSVLO3ERNTRZJHG0G', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'C3FREM', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'YTT6USN5BCYA', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, '5EHJW01BU2OJ9JKJWAS', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'BKWTLRI9EO23T4J63345P', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'AJ92P9GU71', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, '769C58JH910T5GZCLRT', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'JU7F89YBYG0OZOFS', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, '56E0F3JOJJDS45YBX1N', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, 'B6L7BDOA', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (124, '3OPK3DH4ZI73RO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'CNB4GX0R2UPU', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'M95K5K9QZ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, '41UPBXWORKVV7PPAMXM', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'UUSH3D8PB8YBW6Z', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'KRTZOJ6JKK3X7ZM', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'LYBLSUB7S10666J6VJOCJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'MT9WD29UG1D8JKZXYHBR', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'Y5X3BG429E28TN', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'VMHJQ7O5VWP92VZB2Z', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'LU89A', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'UEN7FUN', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, '77ATEV', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'AJ7OC2KWG', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'X9QBYBID', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'CM3XLMHENI7S8UOPK', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'TNQ84HUOAXE', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'JWOG2WE8', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'Y2Y239JDBZL66K3', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'Y2N0RN', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'U9DHEPXBH4CDB', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, 'F56V57VNWTG0PEW', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, '3V23HB1NVU3YG8XT3A', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (125, '5UYBB7', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'UFILA9KZ2QEMYG76', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'XZPVJMYIMHH', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, '2ZYIUXLHU7ORABUN6Y', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'FZ56D1Q7Q', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'PH7NZ3', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, '45E2D7MV4MJN0', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'IL3GL4T', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, '6Q3GO4LPZG2E8LZQ7DUXY', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'SANR15W261T', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'KZ9U1E2JUS9SMJ6TQ8K', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'L14HL58UR82FUOI629TZJ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'KQSJZL6L31I5BAKXS', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (126, 'N1CTQN1AEDWM04Q00', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'VNFQD1PRQSES92H', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'UA827GA6WFRTQ2', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'D8TJJICNEOV82', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'GS0MI64', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'IP6EQZ7C4XWJFW4CF6', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'SJZRNHN', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, '7L9KY', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, '3OPK3DH4ZI73RO', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'A9ACTJAH3F', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, '6OAUBOFNMM4799S88V', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'HFO63EMAFK5M4V0PD5V8', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'SDUC8HE5XIPW5804', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'TNQ84HUOAXE', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'PRBQVB3CP8C', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, '3V23HB1NVU3YG8XT3A', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'B5B2RB', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'UQ0M7JMGK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, '6MA0OT1J2', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, '4FQOB', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'UVVHVAESPAV8HXMX45', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, '1JXH31GX8HUYX0IE83', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, '53F6XOJ1JUIB', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'KQSJZL6L31I5BAKXS', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (127, 'P8YT53FSZ0KG', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'Y2N0RN', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'YN2SDTYRD0CIJ72KKJK', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, '1XSJFSKVS6C8', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'MLERQAU3CZW9Y3C', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, '02C91G77F9S3T', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'L3IIEMC1WYM3W1KGXQ9R1', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'LHK0T9S', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, '6WMZLW55AV0D86', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'R0UDL5T0Q', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'ZT29H850LSWEYUZ3SSAZU', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'U9DHEPXBH4CDB', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'Z0XA0YOXAY6UO10', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, '2K7X7R3APTU1FDLSP84', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'DA9GT25X739M1Y0', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'N02AJ1BU62TVQAV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'JYSNDB7QNJ62KFLHS1IME', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'WSZK32VL95', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'CIAALP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'YUJ72682YR6XBDTDSKH', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, '04GWNLKR', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'DITF47NV9AH76', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, '7YNBEF', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (128, 'X6W6X5GILAJ2', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'UEN7FUN', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'WE1Q5UY', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'PPA2QBF2G', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'MVO34C', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'SCH5S98F9C9FLIBD1QX4', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'GVU0CP56W22SHL', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'UCVPPZOYXWYY1IQ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, '5IBBA7O5O7HU08J', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'IL3GL4T', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'YTT6USN5BCYA', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'NIAUET3FH6CU', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (129, 'N55RS7PHXKJZ283K', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (130, 'Z00K1Q', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (130, '92RNQOWISW5Y9', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (130, 'L1XOEG68Y1O9P', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (130, '4Y6Z9X12', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (130, 'FIIVD9380IDSKURUJ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (130, 'ZCDOKYIXEJ7UHB0WXVT', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (131, 'MA4BF371H1LMWOCJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (131, 'J6KSOE45K2VT2WS', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (131, 'BKWTLRI9EO23T4J63345P', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'AQ2LR5R14I', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'VNFQD1PRQSES92H', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, '99QTL5HHJXO8BAPA55VO', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, '5UYBB7', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'FFL7CRM9T1TUNA4A3JK0', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'IVT7I9WFUVYNTDK', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, '6OAUBOFNMM4799S88V', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, '949BZO', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'ETUSGK66QD61ZH3WOP8R', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'X9QBYBID', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'EY9BOWO0ONREKII9SYIQG', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'SANR15W261T', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'O8UDLDAO', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'MVO34C', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'VF0W3NHMB0IO6T627B', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'Y0D4BUL8', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, '6MA0OT1J2', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'MJZ47QMOV', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, 'LYBLSUB7S10666J6VJOCJ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (132, '3HHJP2PO2PP', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, 'ZGDI8EJIXNAIHAUG0V', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, 'L3IIEMC1WYM3W1KGXQ9R1', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, '6Q3GO4LPZG2E8LZQ7DUXY', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, 'BUE03EPCMK5CN5W86K7', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, 'P3MGNX9GXNNEJT', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, 'V2U95QBAM', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, '1AHOY', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, '7NFADWE0UFFHJAVV', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (133, '8XJNZJMFJI937JIU064', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'YXRFHRLQ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'HUFMZDU8S', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, '53F6XOJ1JUIB', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'C2X22WDYBYOD8A1H8X9XC', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, '020UJRJD', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'MV6XK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'Z0XA0YOXAY6UO10', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'GFN4N4GWD', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, '23CWHYK', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, '981M45J7A6LBAE', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'N55RS7PHXKJZ283K', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'GF4IPWZXNXZNUJM', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, '1AHOY', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, '5A2HLJ6P', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'PRBQVB3CP8C', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (134, 'VNFQD1PRQSES92H', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'BHOXCIQ5EP4DJ34JF6', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'JRQQAAGBDRKLHTRGH7', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'MF44FFETGVBGI2L506L', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'Y2Y239JDBZL66K3', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'UQ0M7JMGK', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'UA827GA6WFRTQ2', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'V2U95QBAM', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'WV8XBDGHNU2CT6SY', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, 'P9K4TFHA36EYQVU', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, '5FKZ5E1M87QESJ30Q', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (135, '2IS59RXMJQH6K', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'WUUPSVKB6AIT9P8FWBLB2', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, '2SW2XT1PPYX', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, '86WVI35UB8ONK4BG92', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'WPF946Y2FHYCJCVBZ5DS', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, '97QPRUTYL', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'Y0D4BUL8', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, '8HBG25ODWXJT9ECAHI', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, '3OT4U0OZFD95E9K', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'CXWEZJ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, '56E0F3JOJJDS45YBX1N', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'FNJP0CUCSX2G282D26L58', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, '3EERUKR5EZZUJRL6', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'D3KWLC77', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'FCU04Y3TF63OILE5RSL3', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'UDWHX1O6B', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'U9DHEPXBH4CDB', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, '3BVQ0WX4BBQRYZ0K3O0R', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'GS0MI64', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'MA4BF371H1LMWOCJ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'O8KRDW60J3K0XRHDT6XDT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'VF3A3D', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'LN0AZUKE0A1TMT3GJ59', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'Y883RPGH7U', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'A2EPH58ZDGO7J', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (136, 'QSP89T0I9JLS', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'XK54KCGLQF9VX01VVB40', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'CDQIS', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'Z5OJ6ZTHT1O76CHLG9', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'D4PEN3PQOBHRL', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'JVDOL8R', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'UUSH3D8PB8YBW6Z', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'RSO05ATN6DZQ9I', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, '3X7PR3QB8KHLPUC2Z', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'ET1Q87U38A3MJ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, '67FYTY9BLZIR', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'UFILA9KZ2QEMYG76', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'XLVYCBFBC03JVAQG', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'IKPREAG', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, '5ZAB582F4YY0U37NG6P', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, '0J7QVKSSD', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, 'MF44FFETGVBGI2L506L', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (137, '1S7WS7PKONTWYWX4', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (138, 'IP6EQZ7C4XWJFW4CF6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (138, 'BH5BATRJWJY', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (138, '5YJUXY2VSUV5XI5G3DIZ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (138, '9QH77BNMAK30A6TET3UK', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (138, 'U9DHEPXBH4CDB', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (139, 'N55RS7PHXKJZ283K', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (139, '6MA0OT1J2', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (139, '0MWSLI7P1QKZZ4', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (139, '3BVQ0WX4BBQRYZ0K3O0R', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (139, 'RAONEMJLR17H5', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, '5YXOUQ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, '9LNGWY5DWNPA51K2', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, '6OAUBOFNMM4799S88V', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'PPA2QBF2G', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'HFO63EMAFK5M4V0PD5V8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'UUSH3D8PB8YBW6Z', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'Z485XQ48L6M', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'XTKKXBLZZBX93GS', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'C2X22WDYBYOD8A1H8X9XC', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'FFL7CRM9T1TUNA4A3JK0', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'RI5SPSRSS1R29UB', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (140, 'IDAWON', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (141, '4HUT9MXQB8PGY2KBAL', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (141, '3OT4U0OZFD95E9K', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (141, 'NS1I9XWC', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'XHYK1', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, '5K4EC6Y', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'W22SIT2WXELR', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'BHOXCIQ5EP4DJ34JF6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'M79CEQBO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'IRJVC7CDJH2UTY011', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'XMMDEQZECUBMWVS8', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'ETUSGK66QD61ZH3WOP8R', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'UDWHX1O6B', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'TJIU0S', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'W7SM1', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'MVO34C', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (142, 'PRBQVB3CP8C', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'VNFQD1PRQSES92H', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'O7QS8WMH8LONPN7YJ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, '2SW2XT1PPYX', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, '2C67F990PDFNMH2KND', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'OOCLVBBZCZIG', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'Z0XA0YOXAY6UO10', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, '2BSZUM5KAOR9G5GXMZ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'Y5X3BG429E28TN', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'W7SM1', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, '36T1VGU3G0LYF', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'HXQOFUOQ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'GF4IPWZXNXZNUJM', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'GS0MI64', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'N1UTCLLRD5VJWEHDWBN6', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, '1AHOY', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'CIAALP', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'XMMDEQZECUBMWVS8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'C4D6Z4B', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'QCO6X9ETFPG15BL2', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'BUE03EPCMK5CN5W86K7', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'B732DEO', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'O0AJGLWV5YIJSHGE3', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, '2CID2PM88ZLMUDAL', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (143, 'CYMMQQMYEWRO6CB5XS9P', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (144, 'C8IA6', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (144, 'PRBQVB3CP8C', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (144, 'FZ56D1Q7Q', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (144, 'B732DEO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (145, 'RAONEMJLR17H5', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (145, '1OV0H27YQSDB4', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (145, 'FCU04Y3TF63OILE5RSL3', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (145, 'W7SM1', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (145, '0BFMVYU3NOGELDTTJC', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (145, 'LFZV37F28', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'VI9T9PFU02Y4M3P3PUUPE', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, '5EHJW01BU2OJ9JKJWAS', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'DA9GT25X739M1Y0', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'RI5SPSRSS1R29UB', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'APVBWS1XK7E', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'A2EPH58ZDGO7J', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'NKUPQ7U18D994E', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'ZD2CRTD', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'O17E3BH6NFU', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, '699OPJEQ5B20HL07', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'IP6EQZ7C4XWJFW4CF6', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'CWO0WGF5R', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, '9DGZDOJSMHYA', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, '57VGLO', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'NZ8EK6Z7CO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'PDC44U9YAF75YQQJG', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'SANR15W261T', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, '67FYTY9BLZIR', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (146, 'YUJ72682YR6XBDTDSKH', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'FIIVD9380IDSKURUJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'APVBWS1XK7E', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'OVM4J', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '020UJRJD', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'C2X22WDYBYOD8A1H8X9XC', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'CYMMQQMYEWRO6CB5XS9P', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'CZFJ09QE', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'RI5SPSRSS1R29UB', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '21UGUUBNP1', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '2IS59RXMJQH6K', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'R0UDL5T0Q', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '7L9KY', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '6X9Q3TM0S18EFZG7', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '1XSJFSKVS6C8', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'VF0W3NHMB0IO6T627B', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '3XFYKT1MPFV4KS9AT900', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'DLTZVZJ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'ETUSGK66QD61ZH3WOP8R', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'VBMSWQECXWSDL7J', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, 'I0OJ9748', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '85JV1UMUHD0L52HHVV', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (147, '41UPBXWORKVV7PPAMXM', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, 'UCVPPZOYXWYY1IQ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, 'IDAWON', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, '7UGDOWFW37N7HBK', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, 'KHS02Q99V', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, 'P8YT53FSZ0KG', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, '1OV0H27YQSDB4', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, '2GOYYZDWAU2NWJXLT', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, '7L9KY', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, 'FYRZH2Y0AJ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, 'RSO05ATN6DZQ9I', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, 'OOCLVBBZCZIG', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (148, 'L8R0R2CPTTN2Z0SQ55BV', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'PINOPOLHDJHEK', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'R0UDL5T0Q', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'AQ2LR5R14I', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'TS0AU', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'Y88JFXE7I41E', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, '589SANB', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'N1UTCLLRD5VJWEHDWBN6', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'XZPVJMYIMHH', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'LFZV37F28', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'FYRZH2Y0AJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'N55RS7PHXKJZ283K', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'MKO9QET3HY7P', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, '6X9Q3TM0S18EFZG7', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'F0U1TA', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, '56E0F3JOJJDS45YBX1N', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'RK0HL3Z5I7CG6Z9SNV8', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (149, 'CM3XLMHENI7S8UOPK', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, '2KEDWE', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'UQ0M7JMGK', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'M20NJW31JND', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, '6OAUBOFNMM4799S88V', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'B6L7BDOA', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, '5K4EC6Y', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'AJ92P9GU71', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'YTT6USN5BCYA', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'Y88JFXE7I41E', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'MJJSR96LPHTNMZHIR8REL', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'BKWTLRI9EO23T4J63345P', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'EA4RXFRYJTRY', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, '6LSVLO3ERNTRZJHG0G', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, '8871TAL4EDLF5BCYGA5S', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'WUUPSVKB6AIT9P8FWBLB2', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'JVDOL8R', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'PEVLRHGO05S1XOQFS6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, '7YNBEF', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (150, 'VMHJQ7O5VWP92VZB2Z', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, '3TGKD7HO9EKV69R0UIP', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, '8JVZWM0IHY17XX', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'P3MGNX9GXNNEJT', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'O7QS8WMH8LONPN7YJ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, '23CWHYK', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'FT2JICD6YB8PA4B', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'WA25GWM', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'QYJ6CP', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'VI9T9PFU02Y4M3P3PUUPE', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, '9LNGWY5DWNPA51K2', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, '6OAUBOFNMM4799S88V', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, '66S4EM2P', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'M95K5K9QZ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'S1E2GSVTJQ8FDCMKRRGI', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'XK54KCGLQF9VX01VVB40', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'BHOXCIQ5EP4DJ34JF6', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'LFZV37F28', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'W4GWGW5T9D8MKGC23', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'UPT1C', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'BH5BATRJWJY', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'A9ACTJAH3F', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (151, 'MF44FFETGVBGI2L506L', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (152, 'F0U1TA', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (152, '99QTL5HHJXO8BAPA55VO', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (152, 'PDC44U9YAF75YQQJG', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (152, '57VGLO', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (152, '2I43566IFBO', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (152, 'WI6YVYO', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (152, '1JXH31GX8HUYX0IE83', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'D31Z42Z', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '699OPJEQ5B20HL07', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'O17E3BH6NFU', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'X6W6X5GILAJ2', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '0BFMVYU3NOGELDTTJC', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '2C67F990PDFNMH2KND', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'QSP89T0I9JLS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'Z4QYNGYHM7GFKULCOI2UL', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'SANR15W261T', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'EIJ6PEH88HT81OTQ1', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '8XJNZJMFJI937JIU064', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'PINOPOLHDJHEK', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '4ASMEMPZMUTTPV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '53F6XOJ1JUIB', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '5X84IINRW', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '3C0DV9JO5RS5F', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, '7FN4G7FYOI18A2AQVD', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'Q7YGYZ0S40T', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (153, 'LGHJM2WK9TCOOI4MJEE', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, 'QYJ6CP', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, '5ZAB582F4YY0U37NG6P', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, 'J6KSOE45K2VT2WS', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, 'J5C70PD4F9807NC5', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, 'XLVYCBFBC03JVAQG', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, '2FMUFGLRHDZUFPYQ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, 'JYSNDB7QNJ62KFLHS1IME', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, '5FKZ5E1M87QESJ30Q', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, 'Y2N0RN', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (154, '9LNGWY5DWNPA51K2', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'AJ92P9GU71', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, '3XFYKT1MPFV4KS9AT900', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'O8KRDW60J3K0XRHDT6XDT', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, '32KLYLHKPTARYNOX44RGW', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'Y2Y4H', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'TS0AU', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'B732DEO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'UYZQMXQED8H2TW', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'FZ56D1Q7Q', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, '85JV1UMUHD0L52HHVV', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'EHMPBT02NO4LGPA', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'KFBBDJ2O', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'PWJQE', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'CIAALP', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, '45E2D7MV4MJN0', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'MJJSR96LPHTNMZHIR8REL', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, '2Z9615JLE2UIDCM7OD', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (155, 'C4D6Z4B', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (156, 'MF44FFETGVBGI2L506L', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'MK852YS1CMM', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'DX04DLJ1O', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '0I8XSK1UG5C3X', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '1S7WS7PKONTWYWX4', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '4FQOB', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'VMHJQ7O5VWP92VZB2Z', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '6OAUBOFNMM4799S88V', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'IDAWON', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'TS0AU', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'D3KWLC77', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'YTT6USN5BCYA', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'LN0AZUKE0A1TMT3GJ59', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'QVA2UM9VYSWZ2VV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'QCO6X9ETFPG15BL2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '1JXH31GX8HUYX0IE83', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '97QPRUTYL', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'CNB4GX0R2UPU', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '07GN343YO8ISA6', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, 'EHMPBT02NO4LGPA', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '8871TAL4EDLF5BCYGA5S', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '36T1VGU3G0LYF', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (157, '5A2HLJ6P', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'XZPVJMYIMHH', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, '9TD3D26HXZKO1G0HIE5', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'RI5SPSRSS1R29UB', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, '5FKZ5E1M87QESJ30Q', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'DX04DLJ1O', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, '62IZOU76V1EPAPZ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'ASTLCU', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'ZQA56', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, '9GSJMDS78HQN', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, '699OPJEQ5B20HL07', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'IDAWON', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'Z00K1Q', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'WI6YVYO', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, '3XFYKT1MPFV4KS9AT900', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, '2C67F990PDFNMH2KND', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'C2X22WDYBYOD8A1H8X9XC', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'JVDOL8R', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'P3MGNX9GXNNEJT', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'D3KWLC77', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, '45E2D7MV4MJN0', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'AGCYAE21BNK19H', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'F56V57VNWTG0PEW', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (158, 'A2EPH58ZDGO7J', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'TZYP10H0544', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'L8R0R2CPTTN2Z0SQ55BV', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'R0UDL5T0Q', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'YXRFHRLQ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'CM3XLMHENI7S8UOPK', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'EK23AQZCHC1A', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, '8JVZWM0IHY17XX', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'EQ8GW', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, '97N27TIYC', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'YTT6USN5BCYA', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'BUE03EPCMK5CN5W86K7', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'Q7YGYZ0S40T', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, '85JV1UMUHD0L52HHVV', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'WV8XBDGHNU2CT6SY', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'KD57F', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, '2K7X7R3APTU1FDLSP84', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'RK0HL3Z5I7CG6Z9SNV8', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'RRCVTYZQKRRBXM38CN1', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (159, 'BW30ULX2XGPUPLP', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, '2K7X7R3APTU1FDLSP84', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'VPKLW00GUMQ89S7QV', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'XAT20KDG7EMM7', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'BVTXD071JBIUY', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, '6X9Q3TM0S18EFZG7', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'HXQOFUOQ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'MV6XK', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'W4GWGW5T9D8MKGC23', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'P9K4TFHA36EYQVU', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, '5PQJ744', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, '3X7PR3QB8KHLPUC2Z', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'RRCVTYZQKRRBXM38CN1', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'Y2Y4H', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'SDWAOQL6ECL81FBZGH3Z8', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, '23CWHYK', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'GGWXZ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'WQHR6DBMU6W3IJGNIEXF', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'C2X22WDYBYOD8A1H8X9XC', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'P3MGNX9GXNNEJT', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (160, 'L3IIEMC1WYM3W1KGXQ9R1', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (161, 'C4XWVFZ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (161, 'HQRQELWCEHW', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (161, '981M45J7A6LBAE', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (161, 'XMMDEQZECUBMWVS8', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (161, '3OT4U0OZFD95E9K', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (161, 'MKO9QET3HY7P', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (161, '6Q3GO4LPZG2E8LZQ7DUXY', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (161, '5QQQHCZ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (162, 'GU6848TQ4VA5R', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (162, 'ILQNSNAUOE8', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (162, 'KFBBDJ2O', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (162, 'IDAWON', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (162, 'Q7YGYZ0S40T', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (162, 'P3MGNX9GXNNEJT', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (162, 'HFO63EMAFK5M4V0PD5V8', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'CDQIS', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'NS1I9XWC', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, '56E0F3JOJJDS45YBX1N', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'LN0AZUKE0A1TMT3GJ59', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'TS0AU', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'C2X22WDYBYOD8A1H8X9XC', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'XMMDEQZECUBMWVS8', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'N1CTQN1AEDWM04Q00', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, '769C58JH910T5GZCLRT', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, '5QQQHCZ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'FT2JICD6YB8PA4B', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'MVO34C', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (163, 'H8JDI', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'PWJQE', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'BKWTLRI9EO23T4J63345P', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'ILQNSNAUOE8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'QQEYO7KC8BSL5FJ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'M20NJW31JND', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'C3FREM', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'KZ9U1E2JUS9SMJ6TQ8K', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'UVVHVAESPAV8HXMX45', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, '2GOYYZDWAU2NWJXLT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'DA9GT25X739M1Y0', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'UPT1C', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'J6KSOE45K2VT2WS', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'Y2Y4H', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'PINOPOLHDJHEK', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, '86WVI35UB8ONK4BG92', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'X6W6X5GILAJ2', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'N6S5S0', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'B5B2RB', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'EK23AQZCHC1A', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, '85JV1UMUHD0L52HHVV', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, '4ASMEMPZMUTTPV', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, 'RRCVTYZQKRRBXM38CN1', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (164, '3X7PR3QB8KHLPUC2Z', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (165, 'C8IA6', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (165, 'UXHLXFZRSKO', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (165, 'DA9GT25X739M1Y0', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (165, '3V23HB1NVU3YG8XT3A', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (165, 'IVT7I9WFUVYNTDK', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, 'WE1Q5UY', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, '9LNGWY5DWNPA51K2', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, 'YN2SDTYRD0CIJ72KKJK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, 'MJZ47QMOV', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, 'O0AJGLWV5YIJSHGE3', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, 'XMMDEQZECUBMWVS8', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, '3X7PR3QB8KHLPUC2Z', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, 'AJ7OC2KWG', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (166, 'XTKKXBLZZBX93GS', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'BH5BATRJWJY', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'CDQIS', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'XPCN0F1R4', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, '8HBG25ODWXJT9ECAHI', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, '3OPK3DH4ZI73RO', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'L49FNMBCD33DD', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'DX04DLJ1O', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'EGDFF193GSKZX', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'J6KSOE45K2VT2WS', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, '62IZOU76V1EPAPZ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'LHK0T9S', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'XZPVJMYIMHH', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, '3EERUKR5EZZUJRL6', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'XTYF9MP6T4E8C3P2R2VJ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'LYBLSUB7S10666J6VJOCJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'PRBQVB3CP8C', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, '8JVZWM0IHY17XX', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'MF44FFETGVBGI2L506L', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'CBMBFZFMGFQQ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, '67FYTY9BLZIR', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (167, 'YXRFHRLQ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (168, 'GFN4N4GWD', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, 'UA827GA6WFRTQ2', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, '8GIVGTLBQM6Z7J2D4GEK', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, '5FKZ5E1M87QESJ30Q', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, 'MKO9QET3HY7P', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, 'VF0W3NHMB0IO6T627B', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, 'KZ9U1E2JUS9SMJ6TQ8K', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, 'XTYF9MP6T4E8C3P2R2VJ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, 'SANR15W261T', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (169, 'EUEXHHLN3DBDUWM7', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'WDWIEDU09', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'AJ92P9GU71', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'X9QBYBID', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'Y88JFXE7I41E', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'O8KRDW60J3K0XRHDT6XDT', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'IKPREAG', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, '6ZPFBD41AGJG629ELF', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'SJZRNHN', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'HQRQELWCEHW', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'IL3GL4T', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'KFBBDJ2O', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'T5TJZ3PWAKO1O3XF', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, '0M2JXDCLZ0', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'HK06V2AR', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (170, 'OOCLVBBZCZIG', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'UA827GA6WFRTQ2', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'HQRQELWCEHW', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'CXWEZJ', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'FNJP0CUCSX2G282D26L58', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'L3IIEMC1WYM3W1KGXQ9R1', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'OVM4J', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, '92RNQOWISW5Y9', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, '62IZOU76V1EPAPZ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'IVT7I9WFUVYNTDK', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, '699OPJEQ5B20HL07', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'VF0W3NHMB0IO6T627B', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'VF3A3D', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, '97N27TIYC', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, '6MA0OT1J2', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, '949BZO', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (171, 'XHYK1', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (172, 'LHK0T9S', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (172, 'O17E3BH6NFU', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (172, 'PEVLRHGO05S1XOQFS6', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'EK23AQZCHC1A', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, '1JXH31GX8HUYX0IE83', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'UA827GA6WFRTQ2', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'LHK0T9S', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'C4D6Z4B', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, '67IEX5TA4Z39PC', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'YTT6USN5BCYA', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, '21UGUUBNP1', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, '4BQVNNGVBJ7GK5W121', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'N02AJ1BU62TVQAV', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'OOCLVBBZCZIG', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, '020UJRJD', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'P3MGNX9GXNNEJT', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'ETUSGK66QD61ZH3WOP8R', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, '8JVZWM0IHY17XX', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (173, 'GFN4N4GWD', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'XAT20KDG7EMM7', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, '7ZNIARN4KATYPLOR', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'F56V57VNWTG0PEW', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'LHK0T9S', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, '2K7X7R3APTU1FDLSP84', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, '4Y6Z9X12', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'SJZRNHN', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'QVA2UM9VYSWZ2VV', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'CNB4GX0R2UPU', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, '32KLYLHKPTARYNOX44RGW', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'PINOPOLHDJHEK', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'AXF6A09GKL6POJ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (174, 'BHOXCIQ5EP4DJ34JF6', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, '5X84IINRW', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, '949BZO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'AQ2LR5R14I', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'C6TPIU7QZ4W3XY9', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'KD57F', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'YN2SDTYRD0CIJ72KKJK', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'MLERQAU3CZW9Y3C', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'L8R0R2CPTTN2Z0SQ55BV', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'X6W6X5GILAJ2', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'JVDOL8R', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, '67FYTY9BLZIR', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'RAONEMJLR17H5', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'HK06V2AR', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, '90K8LVI', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'AJ7OC2KWG', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'FYRZH2Y0AJ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (175, 'L9HEMTXMNU1S8JULJX', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '3QM188FD73U', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'VWF8C0OHLIHIST', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '6MA0OT1J2', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '981M45J7A6LBAE', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'KFBBDJ2O', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'KZ9U1E2JUS9SMJ6TQ8K', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'EY9BOWO0ONREKII9SYIQG', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'F0U1TA', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '5A2HLJ6P', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'MA4BF371H1LMWOCJ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'CIAALP', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '9DGZDOJSMHYA', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '7UGDOWFW37N7HBK', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'UUSH3D8PB8YBW6Z', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '2ITL25BIV7E2VW2THO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'Y5X3BG429E28TN', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '30OR6SWDE690', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '2SW2XT1PPYX', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'MT9WD29UG1D8JKZXYHBR', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'ZGDI8EJIXNAIHAUG0V', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, 'QIO1AG64EYG02PKZEF6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '5EHJW01BU2OJ9JKJWAS', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '0I8XSK1UG5C3X', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '5QQQHCZ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '3X7PR3QB8KHLPUC2Z', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (176, '020UJRJD', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, '57VGLO', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'L49FNMBCD33DD', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'VWF8C0OHLIHIST', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, '22K2FGBX3B7MGM3D4U', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, '1OV0H27YQSDB4', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'QSP89T0I9JLS', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, '86WVI35UB8ONK4BG92', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'UEN7FUN', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'Z00K1Q', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'C2X22WDYBYOD8A1H8X9XC', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'Y2Y239JDBZL66K3', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'BH5BATRJWJY', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'KZ9U1E2JUS9SMJ6TQ8K', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'Z0ETQEE80W6', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'QQEYO7KC8BSL5FJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'JVDOL8R', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'MUJZQQ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'JRQQAAGBDRKLHTRGH7', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'N1CTQN1AEDWM04Q00', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'AGCYAE21BNK19H', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'O8KRDW60J3K0XRHDT6XDT', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (177, 'AXF6A09GKL6POJ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'NIAUET3FH6CU', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'P9K4TFHA36EYQVU', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, '2I43566IFBO', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'YN2SDTYRD0CIJ72KKJK', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'HK06V2AR', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'T43XM4QIZMCXKVUXFLYB', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'CUQUP009JQLD4ZRBZS', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'M20NJW31JND', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, '23CWHYK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, '8HBG25ODWXJT9ECAHI', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'MT9WD29UG1D8JKZXYHBR', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'Y2Y4H', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, '2KEDWE', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (178, 'CDQIS', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'A2EPH58ZDGO7J', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'D3KWLC77', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'C2X22WDYBYOD8A1H8X9XC', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'CDQIS', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'W7SM1', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, '5A2HLJ6P', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, '4L1DW5PKXJ55', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'X9QBYBID', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'SJZRNHN', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'R0UDL5T0Q', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'ERZG9X', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'NZ8EK6Z7CO', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, '5XOH5', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'UQ0M7JMGK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, '07GN343YO8ISA6', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, '41UPBXWORKVV7PPAMXM', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'Y2Y4H', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'XTKKXBLZZBX93GS', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'XLVYCBFBC03JVAQG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'L8R0R2CPTTN2Z0SQ55BV', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (179, 'BHOXCIQ5EP4DJ34JF6', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, '020UJRJD', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, '5IBBA7O5O7HU08J', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'WA25GWM', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'SCH5S98F9C9FLIBD1QX4', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'J8TFEGSIMBFKBQHXN', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'UUSH3D8PB8YBW6Z', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'Y3F7W49Z', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'MVO34C', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'TZYP10H0544', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'L9HEMTXMNU1S8JULJX', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'Z0XA0YOXAY6UO10', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'VI9T9PFU02Y4M3P3PUUPE', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'IHKERZ4HCFSBT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'XPCN0F1R4', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (180, 'RSO05ATN6DZQ9I', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'C4D6Z4B', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'PPA2QBF2G', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'FQXWTL', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'IKPREAG', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '7Q5BDZTTRD9ESU2G', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'N6S5S0', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'PRBQVB3CP8C', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'SCH5S98F9C9FLIBD1QX4', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'PWJQE', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'XLVYCBFBC03JVAQG', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '8871TAL4EDLF5BCYGA5S', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'AQ2LR5R14I', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'HXQOFUOQ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'EGDFF193GSKZX', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '6WMZLW55AV0D86', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'M70ZQD6N2FJQ1OJA', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '67IEX5TA4Z39PC', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '5A2HLJ6P', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '6OAUBOFNMM4799S88V', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '6LSVLO3ERNTRZJHG0G', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'P9K4TFHA36EYQVU', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '67FYTY9BLZIR', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, '2K7X7R3APTU1FDLSP84', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (181, 'B5B2RB', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (182, '3BVQ0WX4BBQRYZ0K3O0R', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (182, '0I8XSK1UG5C3X', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (182, 'BDAAVO', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (182, 'VF0W3NHMB0IO6T627B', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (183, 'GS0MI64', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (183, 'VF3A3D', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (183, 'MQ8F85J465QUJDU4RLTD', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (183, 'BVTXD071JBIUY', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (183, 'MJJSR96LPHTNMZHIR8REL', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (183, 'UQ0M7JMGK', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (183, 'N1UTCLLRD5VJWEHDWBN6', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (184, '9QH77BNMAK30A6TET3UK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, 'VPKLW00GUMQ89S7QV', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, '5IBBA7O5O7HU08J', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, '45E2D7MV4MJN0', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, '97N27TIYC', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, '2I43566IFBO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, '3C0DV9JO5RS5F', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, 'ZT29H850LSWEYUZ3SSAZU', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, 'MCD0BZ68ZBOUZ8', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, 'TZYP10H0544', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, '02C91G77F9S3T', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (185, 'MA4BF371H1LMWOCJ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'PDC44U9YAF75YQQJG', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'PLUBPMU7S9ZQ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'KRTZOJ6JKK3X7ZM', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'DTJ3FON8UE3D95N4INSF', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'PEVLRHGO05S1XOQFS6', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'JU7F89YBYG0OZOFS', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'MJZ47QMOV', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, '5YJUXY2VSUV5XI5G3DIZ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'TNQ84HUOAXE', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'LN0AZUKE0A1TMT3GJ59', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, '36T1VGU3G0LYF', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (186, 'OOCLVBBZCZIG', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, 'ILQNSNAUOE8', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, 'WA25GWM', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, 'L14HL58UR82FUOI629TZJ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, 'B5B2RB', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, '2ZYIUXLHU7ORABUN6Y', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, 'CXWEZJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, '07GN343YO8ISA6', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, '1AHOY', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, 'IRJVC7CDJH2UTY011', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (187, '67FYTY9BLZIR', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, '07GN343YO8ISA6', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'VF0W3NHMB0IO6T627B', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'HK06V2AR', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'FQXWTL', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'C8IA6', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'OQ3J8K5O6JQ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, '699OPJEQ5B20HL07', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, '5YJUXY2VSUV5XI5G3DIZ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, '981M45J7A6LBAE', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'C2X22WDYBYOD8A1H8X9XC', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'JYSNDB7QNJ62KFLHS1IME', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'Y5X3BG429E28TN', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'ZD2CRTD', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'XK54KCGLQF9VX01VVB40', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'F0U1TA', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'BH5BATRJWJY', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'Y88JFXE7I41E', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'O8KRDW60J3K0XRHDT6XDT', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'P8YT53FSZ0KG', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'IP6EQZ7C4XWJFW4CF6', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'ASTLCU', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'A9ACTJAH3F', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'ZT29H850LSWEYUZ3SSAZU', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (188, 'L49FNMBCD33DD', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, '4FQOB', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, 'EHMPBT02NO4LGPA', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, 'AQ2LR5R14I', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, '5FKZ5E1M87QESJ30Q', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, 'RSO05ATN6DZQ9I', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, '020UJRJD', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, 'QVA2UM9VYSWZ2VV', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, 'FIIVD9380IDSKURUJ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, '23CWHYK', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, '0I8XSK1UG5C3X', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (189, 'OQ3J8K5O6JQ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, '2228EKDSEF', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, '2GOYYZDWAU2NWJXLT', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, '7Q5BDZTTRD9ESU2G', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, '53F6XOJ1JUIB', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, '77ATEV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'EHMPBT02NO4LGPA', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, '4FQOB', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, '3XFYKT1MPFV4KS9AT900', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'WK8M1SJJ5IRDHDS', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'CM3XLMHENI7S8UOPK', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'BYPLGOFPQMJT', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'PPA2QBF2G', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'RAONEMJLR17H5', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, '5A2HLJ6P', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'QYYXP', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'WVYMG3GV', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'L14HL58UR82FUOI629TZJ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'MJJSR96LPHTNMZHIR8REL', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'V9FI47R25KVSIK', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'BDAAVO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'J8TFEGSIMBFKBQHXN', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'FYRZH2Y0AJ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (190, 'CDQIS', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'D5X3JMCXX', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'VWF8C0OHLIHIST', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'M70ZQD6N2FJQ1OJA', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, '13URU71I0ET52TX', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'J8TFEGSIMBFKBQHXN', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'VI9T9PFU02Y4M3P3PUUPE', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'EK23AQZCHC1A', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'GFN4N4GWD', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'O8UDLDAO', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'UVVHVAESPAV8HXMX45', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'QYJ6CP', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, '0BFMVYU3NOGELDTTJC', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (191, 'S1E2GSVTJQ8FDCMKRRGI', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (192, 'OQ3J8K5O6JQ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (192, '5EHJW01BU2OJ9JKJWAS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (192, 'PPA2QBF2G', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (192, 'R7BSNEKS4IGM4OVIEXLK', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (192, 'L3IIEMC1WYM3W1KGXQ9R1', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (192, 'MVO34C', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (192, 'NKUPQ7U18D994E', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (192, '9QH77BNMAK30A6TET3UK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'JWOG2WE8', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'OVM4J', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'VPKLW00GUMQ89S7QV', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'Q7YGYZ0S40T', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, '0MWSLI7P1QKZZ4', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'S1E2GSVTJQ8FDCMKRRGI', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'PWJQE', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'C4XWVFZ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, '2GOYYZDWAU2NWJXLT', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, '2CID2PM88ZLMUDAL', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'JRQQAAGBDRKLHTRGH7', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'CNB4GX0R2UPU', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, '3XFYKT1MPFV4KS9AT900', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, '8XJNZJMFJI937JIU064', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (193, 'G1UEQBK09', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (194, '7NFADWE0UFFHJAVV', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (194, '4Y6Z9X12', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (194, 'N1CTQN1AEDWM04Q00', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (194, '2Z9615JLE2UIDCM7OD', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (194, 'QCO6X9ETFPG15BL2', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (194, '6V4B2UHOK5ZM1OWYE8MV', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (194, '4HUT9MXQB8PGY2KBAL', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (195, 'A9ACTJAH3F', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (196, 'GFN4N4GWD', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (196, '6LSVLO3ERNTRZJHG0G', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (196, 'UFILA9KZ2QEMYG76', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (196, '699OPJEQ5B20HL07', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'FZ56D1Q7Q', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'B5B2RB', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'LGHJM2WK9TCOOI4MJEE', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'BUE03EPCMK5CN5W86K7', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '5A2HLJ6P', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '3C0DV9JO5RS5F', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'UEN7FUN', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '36T1VGU3G0LYF', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'EY9BOWO0ONREKII9SYIQG', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '0M2JXDCLZ0', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '3QM188FD73U', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '9TD3D26HXZKO1G0HIE5', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '8871TAL4EDLF5BCYGA5S', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'GGWXZ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '4Y6Z9X12', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'DLTZVZJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '5K4EC6Y', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'GS0MI64', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'CXWEZJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'UUSH3D8PB8YBW6Z', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'NZ8EK6Z7CO', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'KZ9U1E2JUS9SMJ6TQ8K', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'T3RTSEYP98CYC1TYM', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '27MCUEOD4FUNSK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, 'SJZRNHN', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (197, '45E2D7MV4MJN0', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (198, 'WUUPSVKB6AIT9P8FWBLB2', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (199, '0I8XSK1UG5C3X', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (199, '5X84IINRW', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (199, '77ATEV', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'TZYP10H0544', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'CJ8GR5XGB9XNXCW4LKME', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'EQ8GW', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'C2X22WDYBYOD8A1H8X9XC', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'D4PEN3PQOBHRL', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'IVT7I9WFUVYNTDK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'DTJ3FON8UE3D95N4INSF', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'YN2SDTYRD0CIJ72KKJK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'W7SM1', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'A9ACTJAH3F', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'CBMBFZFMGFQQ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'NKUPQ7U18D994E', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (200, 'Z4QYNGYHM7GFKULCOI2UL', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (201, 'BH5BATRJWJY', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (201, 'CUQUP009JQLD4ZRBZS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (202, 'SDWAOQL6ECL81FBZGH3Z8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (202, 'PDC44U9YAF75YQQJG', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (202, 'AXF6A09GKL6POJ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, 'CBMBFZFMGFQQ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, 'UVVHVAESPAV8HXMX45', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, '9LNGWY5DWNPA51K2', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, 'UPT1C', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, 'T5TJZ3PWAKO1O3XF', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, '62IZOU76V1EPAPZ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, '3OPK3DH4ZI73RO', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, 'BKWTLRI9EO23T4J63345P', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, 'QQEYO7KC8BSL5FJ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (203, 'P9K4TFHA36EYQVU', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'Z0XA0YOXAY6UO10', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'FIIVD9380IDSKURUJ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, '2Z9615JLE2UIDCM7OD', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'Y5X3BG429E28TN', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'KHS02Q99V', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'WA2I45YB7E6DG', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'NB24TDA92', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'C4D6Z4B', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'CXWEZJ', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'UYZQMXQED8H2TW', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'M95K5K9QZ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'EA4RXFRYJTRY', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'BW30ULX2XGPUPLP', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'MT9WD29UG1D8JKZXYHBR', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'C3FREM', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'XTKKXBLZZBX93GS', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, '23CWHYK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'Y3F7W49Z', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'NIAUET3FH6CU', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'S7GNQ742EN7', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'IVT7I9WFUVYNTDK', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (204, 'L14HL58UR82FUOI629TZJ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'S7GNQ742EN7', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'PRBQVB3CP8C', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'RAONEMJLR17H5', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'W4GWGW5T9D8MKGC23', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'D31Z42Z', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'D8TJJICNEOV82', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'BKWTLRI9EO23T4J63345P', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'TNQ84HUOAXE', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'O0AJGLWV5YIJSHGE3', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'MT9WD29UG1D8JKZXYHBR', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'MKO9QET3HY7P', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, '1AHOY', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'CBMBFZFMGFQQ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'A2EPH58ZDGO7J', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'WV8XBDGHNU2CT6SY', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'YN2SDTYRD0CIJ72KKJK', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'AGCYAE21BNK19H', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'CZFJ09QE', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, '5FKZ5E1M87QESJ30Q', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'BW30ULX2XGPUPLP', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'DX04DLJ1O', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'NIAUET3FH6CU', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'OOCLVBBZCZIG', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'UCVPPZOYXWYY1IQ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (205, 'EGDFF193GSKZX', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'L3IIEMC1WYM3W1KGXQ9R1', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'WA25GWM', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, '2FMUFGLRHDZUFPYQ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'GGWXZ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, '5EHJW01BU2OJ9JKJWAS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'MQ8F85J465QUJDU4RLTD', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'Q7YGYZ0S40T', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, '04GWNLKR', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, '56E0F3JOJJDS45YBX1N', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, '97QPRUTYL', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, '3HHJP2PO2PP', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'B5B2RB', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'YN2SDTYRD0CIJ72KKJK', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'AJ7OC2KWG', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (206, 'GS0MI64', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '2K7X7R3APTU1FDLSP84', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'YXRFHRLQ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'SGDU4TYC3Z2CTBO02O', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '2BSZUM5KAOR9G5GXMZ', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'PDC44U9YAF75YQQJG', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'G1UEQBK09', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'MK852YS1CMM', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '8JVZWM0IHY17XX', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'MHBKQ5MZ0SH36X', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'FT2JICD6YB8PA4B', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'A9ACTJAH3F', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '949BZO', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'XLVYCBFBC03JVAQG', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '4L1DW5PKXJ55', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'MV6XK', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '36T1VGU3G0LYF', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'ZCDOKYIXEJ7UHB0WXVT', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '5YJUXY2VSUV5XI5G3DIZ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '5EHJW01BU2OJ9JKJWAS', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'D3KWLC77', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '5UYBB7', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'WA25GWM', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'UFILA9KZ2QEMYG76', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'EHMPBT02NO4LGPA', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, 'L49FNMBCD33DD', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (207, '6ZPFBD41AGJG629ELF', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'C2X22WDYBYOD8A1H8X9XC', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'ELM3O84ALTOWXZH9BYT', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'CM3XLMHENI7S8UOPK', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'C8IA6', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'CWO0WGF5R', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, '8GIVGTLBQM6Z7J2D4GEK', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'WGPHLEQ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, '2C67F990PDFNMH2KND', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, '2GOYYZDWAU2NWJXLT', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'ZT29H850LSWEYUZ3SSAZU', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'LFZV37F28', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, '4BQVNNGVBJ7GK5W121', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, '9GSJMDS78HQN', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (208, 'AGCYAE21BNK19H', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'CYMMQQMYEWRO6CB5XS9P', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, '6V4B2UHOK5ZM1OWYE8MV', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, '2C67F990PDFNMH2KND', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'FCU04Y3TF63OILE5RSL3', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'WA2I45YB7E6DG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'F56V57VNWTG0PEW', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'XMMDEQZECUBMWVS8', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'MHBKQ5MZ0SH36X', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'N1UTCLLRD5VJWEHDWBN6', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'SJZRNHN', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, '6MA0OT1J2', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, '2SW2XT1PPYX', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'AJ7OC2KWG', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'R7BSNEKS4IGM4OVIEXLK', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'WA25GWM', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'QIO1AG64EYG02PKZEF6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'C6TPIU7QZ4W3XY9', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'Y2Y239JDBZL66K3', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'MJZ47QMOV', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'Y88JFXE7I41E', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, '32KLYLHKPTARYNOX44RGW', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'TNQ84HUOAXE', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'WDWIEDU09', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, '41UPBXWORKVV7PPAMXM', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, '53F6XOJ1JUIB', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (209, 'VI9T9PFU02Y4M3P3PUUPE', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (210, '3TGKD7HO9EKV69R0UIP', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (210, 'D3KWLC77', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (210, 'VI9T9PFU02Y4M3P3PUUPE', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (210, '97QPRUTYL', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'ZD2CRTD', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'YUJ72682YR6XBDTDSKH', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'XAT20KDG7EMM7', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, '97QPRUTYL', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, '2CID2PM88ZLMUDAL', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'WA25GWM', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'Z0XA0YOXAY6UO10', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, '3V23HB1NVU3YG8XT3A', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'T43XM4QIZMCXKVUXFLYB', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'PWJQE', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'N1CTQN1AEDWM04Q00', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'BH5BATRJWJY', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'DLTZVZJ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'FT2JICD6YB8PA4B', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (211, 'IDAWON', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'Z00K1Q', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'JJNV2CO48TXANYNFBKDI2', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'LU89A', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'MF44FFETGVBGI2L506L', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'YUJ72682YR6XBDTDSKH', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'P8YT53FSZ0KG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'C4XWVFZ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, '5A2HLJ6P', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'B6L7BDOA', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, '9TD3D26HXZKO1G0HIE5', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'FFL7CRM9T1TUNA4A3JK0', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, '6D6JIDJKU2CCLYW', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'JU7F89YBYG0OZOFS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, '2MS0C07CGKTC2', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'NZ8EK6Z7CO', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'T5TJZ3PWAKO1O3XF', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'S1K5SO8KVT5DEA1', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'XPCN0F1R4', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (212, 'L8R0R2CPTTN2Z0SQ55BV', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'IVT7I9WFUVYNTDK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, '2I43566IFBO', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, '97QPRUTYL', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, '56E0F3JOJJDS45YBX1N', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'S1K5SO8KVT5DEA1', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'KQSJZL6L31I5BAKXS', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'MVO34C', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, '85JV1UMUHD0L52HHVV', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'VI9T9PFU02Y4M3P3PUUPE', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'SJZRNHN', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, '2BSZUM5KAOR9G5GXMZ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'UYZQMXQED8H2TW', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'SGDU4TYC3Z2CTBO02O', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'XTYF9MP6T4E8C3P2R2VJ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'BUE03EPCMK5CN5W86K7', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'UA827GA6WFRTQ2', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'MA4BF371H1LMWOCJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'GGWXZ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'UVVHVAESPAV8HXMX45', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'PLUBPMU7S9ZQ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'D31Z42Z', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (213, 'WPF946Y2FHYCJCVBZ5DS', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (214, 'WE1Q5UY', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (214, 'XLVYCBFBC03JVAQG', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'G1UEQBK09', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'FQXWTL', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'CIAALP', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'CXWEZJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'VPKLW00GUMQ89S7QV', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, '6Q3GO4LPZG2E8LZQ7DUXY', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'MLERQAU3CZW9Y3C', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'PRBQVB3CP8C', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'H8JDI', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, '2KEDWE', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, '67IEX5TA4Z39PC', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'MT9WD29UG1D8JKZXYHBR', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'CJ8GR5XGB9XNXCW4LKME', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'RSO05ATN6DZQ9I', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (215, 'UXHLXFZRSKO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'O8UDLDAO', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'WDWIEDU09', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'JWOG2WE8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'Z0XA0YOXAY6UO10', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'IL3GL4T', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'PH7NZ3', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'BVTXD071JBIUY', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'N1CTQN1AEDWM04Q00', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'Y88JFXE7I41E', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'PPA2QBF2G', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'UQ0M7JMGK', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'PLUBPMU7S9ZQ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, '2C67F990PDFNMH2KND', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'GGWXZ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, '5PQJ744', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'P3MGNX9GXNNEJT', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'FFL7CRM9T1TUNA4A3JK0', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, '0M2JXDCLZ0', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'J6KSOE45K2VT2WS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'W4GWGW5T9D8MKGC23', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'OOCLVBBZCZIG', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, 'ZT29H850LSWEYUZ3SSAZU', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, '13URU71I0ET52TX', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (216, '3HHJP2PO2PP', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (217, 'N1CTQN1AEDWM04Q00', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (217, 'Y0D4BUL8', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (217, 'PH7NZ3', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (217, '66S4EM2P', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (217, '0M2JXDCLZ0', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (217, 'F56V57VNWTG0PEW', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (217, 'BW30ULX2XGPUPLP', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (218, 'AJ92P9GU71', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (219, 'EA4RXFRYJTRY', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (219, 'UFILA9KZ2QEMYG76', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (219, '5YXOUQ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (219, '1S7WS7PKONTWYWX4', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (219, '97QPRUTYL', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (219, '8871TAL4EDLF5BCYGA5S', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (219, '9TD3D26HXZKO1G0HIE5', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (219, 'CBMBFZFMGFQQ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, '3OPK3DH4ZI73RO', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, '4Y6Z9X12', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'CYMMQQMYEWRO6CB5XS9P', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, '86WVI35UB8ONK4BG92', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'XAT20KDG7EMM7', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'CXWEZJ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, '1OV0H27YQSDB4', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'XMMDEQZECUBMWVS8', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'YN2SDTYRD0CIJ72KKJK', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'YXRFHRLQ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'LGHJM2WK9TCOOI4MJEE', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'C2X22WDYBYOD8A1H8X9XC', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'KD57F', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'C3FREM', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'HK06V2AR', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'NS1I9XWC', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'EK23AQZCHC1A', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'X9QBYBID', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (220, 'PEVLRHGO05S1XOQFS6', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'O8KRDW60J3K0XRHDT6XDT', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'YTT6USN5BCYA', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'CIAALP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'SCH5S98F9C9FLIBD1QX4', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'QVA2UM9VYSWZ2VV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'UA827GA6WFRTQ2', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'ASTLCU', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'L9HEMTXMNU1S8JULJX', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'WE1Q5UY', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'H8JDI', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'MJZ47QMOV', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, '0M2JXDCLZ0', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'CUQUP009JQLD4ZRBZS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'UDWHX1O6B', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'WDWIEDU09', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, '45E2D7MV4MJN0', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'FIIVD9380IDSKURUJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'AJ7OC2KWG', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'B732DEO', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'C4XWVFZ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, '3OPK3DH4ZI73RO', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'J5C70PD4F9807NC5', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'KU21KBD7E', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (221, 'ETUSGK66QD61ZH3WOP8R', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'CZFJ09QE', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'T5TJZ3PWAKO1O3XF', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'FT2JICD6YB8PA4B', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, '4BQVNNGVBJ7GK5W121', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'BYFDK23N06Y8', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'QYYXP', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'T43XM4QIZMCXKVUXFLYB', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'IDAWON', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, '2228EKDSEF', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'WK8M1SJJ5IRDHDS', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'MV6XK', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, '0MWSLI7P1QKZZ4', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, 'L8R0R2CPTTN2Z0SQ55BV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (222, '97QPRUTYL', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'XK54KCGLQF9VX01VVB40', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, '92RNQOWISW5Y9', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'W4GWGW5T9D8MKGC23', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, '99QTL5HHJXO8BAPA55VO', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, '21UGUUBNP1', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, '66S4EM2P', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'IVT7I9WFUVYNTDK', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'FQXWTL', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'N02AJ1BU62TVQAV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'ZD2CRTD', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'N1CTQN1AEDWM04Q00', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'BH5BATRJWJY', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'I0K5BF0XOU8RRWJS', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'BKWTLRI9EO23T4J63345P', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (223, 'Y88JFXE7I41E', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (224, 'S1K5SO8KVT5DEA1', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (224, 'Z0XA0YOXAY6UO10', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (224, '699OPJEQ5B20HL07', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (224, 'Y3F7W49Z', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (224, 'D31Z42Z', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (224, '9LNGWY5DWNPA51K2', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, 'XAT20KDG7EMM7', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, 'NIAUET3FH6CU', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, 'JWOG2WE8', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, '7YNBEF', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, 'WPF946Y2FHYCJCVBZ5DS', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, 'WI6YVYO', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, '1AHOY', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, 'GFN4N4GWD', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (225, 'FYRZH2Y0AJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, '02C91G77F9S3T', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'V9FI47R25KVSIK', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'WVYMG3GV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'GF4IPWZXNXZNUJM', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'MHBKQ5MZ0SH36X', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, '1AHOY', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'QCO6X9ETFPG15BL2', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'KHS02Q99V', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'QVA2UM9VYSWZ2VV', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'WGPHLEQ', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, '4BQVNNGVBJ7GK5W121', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'N55RS7PHXKJZ283K', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'T3RTSEYP98CYC1TYM', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, '2C67F990PDFNMH2KND', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'Y2N0RN', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'WA2I45YB7E6DG', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'FQXWTL', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, '2IS59RXMJQH6K', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, '2ITL25BIV7E2VW2THO', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, '4FQOB', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'MJJSR96LPHTNMZHIR8REL', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, 'QYJ6CP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (226, '56E0F3JOJJDS45YBX1N', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'LU89A', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, '99QTL5HHJXO8BAPA55VO', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, '2KEDWE', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'J5C70PD4F9807NC5', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'S7GNQ742EN7', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, '288Y1JHE2K', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, '3XFYKT1MPFV4KS9AT900', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'Y5X3BG429E28TN', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, '2SW2XT1PPYX', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, '020UJRJD', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'Q7YGYZ0S40T', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'O8UDLDAO', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'BYPLGOFPQMJT', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'IVT7I9WFUVYNTDK', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'JYSNDB7QNJ62KFLHS1IME', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'XK54KCGLQF9VX01VVB40', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, '3EERUKR5EZZUJRL6', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'S1E2GSVTJQ8FDCMKRRGI', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (227, 'Z00K1Q', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'ASTLCU', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'GF4IPWZXNXZNUJM', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, '62IZOU76V1EPAPZ', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'MHBKQ5MZ0SH36X', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, '3X7PR3QB8KHLPUC2Z', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'CBMBFZFMGFQQ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'RRCVTYZQKRRBXM38CN1', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'FFL7CRM9T1TUNA4A3JK0', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'UA827GA6WFRTQ2', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'MA4BF371H1LMWOCJ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, '2228EKDSEF', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'KHS02Q99V', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'MV6XK', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'IP6EQZ7C4XWJFW4CF6', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'IRJVC7CDJH2UTY011', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (228, 'MQ8F85J465QUJDU4RLTD', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (229, '7ZNIARN4KATYPLOR', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (229, 'YUJ72682YR6XBDTDSKH', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (229, 'ZCDOKYIXEJ7UHB0WXVT', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (229, 'RGSP8Y', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (229, 'IRJVC7CDJH2UTY011', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (229, 'S1K5SO8KVT5DEA1', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (229, 'BYPLGOFPQMJT', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, 'KZ9U1E2JUS9SMJ6TQ8K', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, 'RK0HL3Z5I7CG6Z9SNV8', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, '5YXOUQ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, 'NKUPQ7U18D994E', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, 'P3MGNX9GXNNEJT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, 'O8KRDW60J3K0XRHDT6XDT', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, '1XSJFSKVS6C8', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, '769C58JH910T5GZCLRT', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (230, 'D5X3JMCXX', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (231, '3QM188FD73U', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, '4FQOB', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'VBMSWQECXWSDL7J', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'W4GWGW5T9D8MKGC23', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'UVVHVAESPAV8HXMX45', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, '3TGKD7HO9EKV69R0UIP', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'CIAALP', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'EHMPBT02NO4LGPA', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, '2ITL25BIV7E2VW2THO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'JRQQAAGBDRKLHTRGH7', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'MUJZQQ', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'DX04DLJ1O', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'C3FREM', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, '2K7X7R3APTU1FDLSP84', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'GF4IPWZXNXZNUJM', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'BKWTLRI9EO23T4J63345P', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'MJZ47QMOV', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'WPF946Y2FHYCJCVBZ5DS', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'NKUPQ7U18D994E', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, '3V23HB1NVU3YG8XT3A', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (232, 'L1XOEG68Y1O9P', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, '3EERUKR5EZZUJRL6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, '589SANB', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'TNQ84HUOAXE', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'NZ8EK6Z7CO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'IL3GL4T', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'FT2JICD6YB8PA4B', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, '6MA0OT1J2', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'FCU04Y3TF63OILE5RSL3', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'VBMSWQECXWSDL7J', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'T3RTSEYP98CYC1TYM', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'TZYP10H0544', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'II6VD1', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'HQRQELWCEHW', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'UVVHVAESPAV8HXMX45', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'CWO0WGF5R', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'S7GNQ742EN7', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'D3KWLC77', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, '949BZO', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, '769C58JH910T5GZCLRT', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'Z4QYNGYHM7GFKULCOI2UL', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'IP6EQZ7C4XWJFW4CF6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'A2EPH58ZDGO7J', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'EA4RXFRYJTRY', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'XZPVJMYIMHH', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'S1K5SO8KVT5DEA1', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (233, 'ZT29H850LSWEYUZ3SSAZU', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'M79CEQBO', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'S1K5SO8KVT5DEA1', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'ZQA56', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'L49FNMBCD33DD', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'O0AJGLWV5YIJSHGE3', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'WE1Q5UY', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'O7QS8WMH8LONPN7YJ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'UDWHX1O6B', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'DA9GT25X739M1Y0', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'V2U95QBAM', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'O8KRDW60J3K0XRHDT6XDT', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, '981M45J7A6LBAE', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'MK852YS1CMM', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'IDAWON', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, '5A2HLJ6P', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'UPT1C', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'UUSH3D8PB8YBW6Z', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'C3FREM', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'B5B2RB', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'PINOPOLHDJHEK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'BVTXD071JBIUY', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (234, 'RSO05ATN6DZQ9I', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (235, 'FZ56D1Q7Q', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (235, 'EUEXHHLN3DBDUWM7', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (235, '7FN4G7FYOI18A2AQVD', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (235, '86WVI35UB8ONK4BG92', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (235, 'M95K5K9QZ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (235, 'J8TFEGSIMBFKBQHXN', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (236, 'Z485XQ48L6M', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (236, '7FN4G7FYOI18A2AQVD', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (236, 'AXF6A09GKL6POJ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (236, 'KHS02Q99V', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (236, 'M70ZQD6N2FJQ1OJA', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (236, 'X9QBYBID', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (237, '2CID2PM88ZLMUDAL', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (238, '020UJRJD', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (238, 'EGDFF193GSKZX', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (238, 'LU89A', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (238, 'MCD0BZ68ZBOUZ8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (238, 'O0AJGLWV5YIJSHGE3', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (238, 'MJZ47QMOV', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (238, 'T3RTSEYP98CYC1TYM', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'S7GNQ742EN7', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'EK23AQZCHC1A', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, '92RNQOWISW5Y9', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'VNFQD1PRQSES92H', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, '3EERUKR5EZZUJRL6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'WK8M1SJJ5IRDHDS', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'U9DHEPXBH4CDB', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'D4PEN3PQOBHRL', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'JVDOL8R', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, '2228EKDSEF', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, '2BSZUM5KAOR9G5GXMZ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, '07GN343YO8ISA6', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'CIAALP', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'SDUC8HE5XIPW5804', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'X9QBYBID', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'FT2JICD6YB8PA4B', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'WGPHLEQ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, '90K8LVI', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'W7SM1', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, '7ZNIARN4KATYPLOR', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'F0U1TA', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (239, 'UVVHVAESPAV8HXMX45', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'Y3F7W49Z', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'V9FI47R25KVSIK', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'V2U95QBAM', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'R3HEM3T897D8B', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'CBMBFZFMGFQQ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'OWP3D0V', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'LU89A', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'PWJQE', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'B732DEO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'TS0AU', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'I0K5BF0XOU8RRWJS', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'HUFMZDU8S', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'KHS02Q99V', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'ZQA56', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (240, 'X6W6X5GILAJ2', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (241, '92RNQOWISW5Y9', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (241, '5IBBA7O5O7HU08J', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (241, 'Y2N0RN', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (241, 'VMHJQ7O5VWP92VZB2Z', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (241, '7L9KY', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (241, '769C58JH910T5GZCLRT', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (241, 'PINOPOLHDJHEK', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (241, '2KEDWE', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (242, '7L9KY', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (242, '23CWHYK', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (242, 'WQHR6DBMU6W3IJGNIEXF', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, 'FQXWTL', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, 'C2X22WDYBYOD8A1H8X9XC', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, '3OPK3DH4ZI73RO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, 'O17E3BH6NFU', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, 'RAONEMJLR17H5', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, 'ET1Q87U38A3MJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, 'BKWTLRI9EO23T4J63345P', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, 'H8JDI', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (243, 'WDWIEDU09', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (244, 'J8TFEGSIMBFKBQHXN', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'UPT1C', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'XAT20KDG7EMM7', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'P9K4TFHA36EYQVU', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'T43XM4QIZMCXKVUXFLYB', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'VMHJQ7O5VWP92VZB2Z', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'Z5OJ6ZTHT1O76CHLG9', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, '8JVZWM0IHY17XX', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'EHMPBT02NO4LGPA', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'ASTLCU', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, '13QF5RTP', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, '9QH77BNMAK30A6TET3UK', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'Y3F7W49Z', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, '3HHJP2PO2PP', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'CBMBFZFMGFQQ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, '3X7PR3QB8KHLPUC2Z', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'ETUSGK66QD61ZH3WOP8R', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'VWF8C0OHLIHIST', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, '5A2HLJ6P', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, '6ZPFBD41AGJG629ELF', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, '5YXOUQ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (245, 'AJ92P9GU71', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'AJ92P9GU71', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'Q7YGYZ0S40T', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'P9K4TFHA36EYQVU', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, '3HHJP2PO2PP', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, '6OAUBOFNMM4799S88V', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, '90K8LVI', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'WGPHLEQ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'RAONEMJLR17H5', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'NZ8EK6Z7CO', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, '7FN4G7FYOI18A2AQVD', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'PH7NZ3', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'SANR15W261T', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'MHBKQ5MZ0SH36X', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'W22SIT2WXELR', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'GVU0CP56W22SHL', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (246, 'L14HL58UR82FUOI629TZJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (247, 'AGCYAE21BNK19H', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (247, 'M70ZQD6N2FJQ1OJA', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, '21UGUUBNP1', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'S1E2GSVTJQ8FDCMKRRGI', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, '2I43566IFBO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, '3X7PR3QB8KHLPUC2Z', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'Q7YGYZ0S40T', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'Z0XA0YOXAY6UO10', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'FYRZH2Y0AJ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, '3XFYKT1MPFV4KS9AT900', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'KD57F', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'CIAALP', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'W4GWGW5T9D8MKGC23', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'GU6848TQ4VA5R', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, '6D6JIDJKU2CCLYW', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'M95K5K9QZ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'GVU0CP56W22SHL', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'XLVYCBFBC03JVAQG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'BHOXCIQ5EP4DJ34JF6', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'UEN7FUN', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, '67FYTY9BLZIR', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, '27MCUEOD4FUNSK', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'VI9T9PFU02Y4M3P3PUUPE', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'QYYXP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, '5EHJW01BU2OJ9JKJWAS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (248, 'MQ8F85J465QUJDU4RLTD', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'QSP89T0I9JLS', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'WUUPSVKB6AIT9P8FWBLB2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'V9FI47R25KVSIK', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'O7QS8WMH8LONPN7YJ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'UUSH3D8PB8YBW6Z', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, '57VGLO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, '3X7PR3QB8KHLPUC2Z', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, '7Q5BDZTTRD9ESU2G', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'UA827GA6WFRTQ2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'D4U6ZK8KO3U9N', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'MF44FFETGVBGI2L506L', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'BH5BATRJWJY', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'H8JDI', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'B732DEO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, '22K2FGBX3B7MGM3D4U', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'MQC9YX5NTF169OM1', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, '45E2D7MV4MJN0', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, 'XTYF9MP6T4E8C3P2R2VJ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (249, '2MS0C07CGKTC2', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'WE1Q5UY', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'KRTZOJ6JKK3X7ZM', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, '2Z9615JLE2UIDCM7OD', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'SDWAOQL6ECL81FBZGH3Z8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'VBMSWQECXWSDL7J', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, '2KEDWE', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'H8JDI', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'R3HEM3T897D8B', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'HUFMZDU8S', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'MV6XK', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, '7L9KY', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'EQ8GW', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'ASTLCU', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'R7BSNEKS4IGM4OVIEXLK', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, '67IEX5TA4Z39PC', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, '4FQOB', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'IP6EQZ7C4XWJFW4CF6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'U9DHEPXBH4CDB', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'ZCDOKYIXEJ7UHB0WXVT', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, 'MT9WD29UG1D8JKZXYHBR', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (250, '5PQJ744', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'R3HEM3T897D8B', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'CZFJ09QE', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'MK852YS1CMM', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'JVDOL8R', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'DTJ3FON8UE3D95N4INSF', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'RK0HL3Z5I7CG6Z9SNV8', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'HXQOFUOQ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, '27MCUEOD4FUNSK', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'IVT7I9WFUVYNTDK', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, 'MQC9YX5NTF169OM1', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, '699OPJEQ5B20HL07', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, '6OAUBOFNMM4799S88V', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (251, '5X84IINRW', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, 'NB24TDA92', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, '13QF5RTP', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, 'CBMBFZFMGFQQ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, '2Z9615JLE2UIDCM7OD', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, 'GU6848TQ4VA5R', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, 'PRBQVB3CP8C', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, '981M45J7A6LBAE', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, '53F6XOJ1JUIB', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (252, '07GN343YO8ISA6', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (253, '769C58JH910T5GZCLRT', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (253, '7SPGQCTJ83R7DVZD', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (253, 'QQEYO7KC8BSL5FJ', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (253, '1JXH31GX8HUYX0IE83', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (253, 'DITF47NV9AH76', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (253, 'A2EPH58ZDGO7J', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (254, 'EHMPBT02NO4LGPA', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (254, 'KRTZOJ6JKK3X7ZM', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'S7GNQ742EN7', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, '7FN4G7FYOI18A2AQVD', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'LHK0T9S', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'O7QS8WMH8LONPN7YJ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'C3FREM', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, '4L1DW5PKXJ55', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'RGSP8Y', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'WA25GWM', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'Z5OJ6ZTHT1O76CHLG9', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'DITF47NV9AH76', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, '2C67F990PDFNMH2KND', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'V2U95QBAM', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'IDAWON', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'D4U6ZK8KO3U9N', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, 'EK23AQZCHC1A', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (255, '1AHOY', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'RGSP8Y', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, '0I8XSK1UG5C3X', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'D8TJJICNEOV82', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'Y5X3BG429E28TN', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'XAT20KDG7EMM7', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'BW30ULX2XGPUPLP', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, '7YNBEF', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'N02AJ1BU62TVQAV', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, '2CID2PM88ZLMUDAL', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'L8R0R2CPTTN2Z0SQ55BV', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'VMHJQ7O5VWP92VZB2Z', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'RAONEMJLR17H5', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'MQC9YX5NTF169OM1', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'VBMSWQECXWSDL7J', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, '36T1VGU3G0LYF', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'ZD2CRTD', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'IKPREAG', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, '92RNQOWISW5Y9', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, '6LSVLO3ERNTRZJHG0G', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'CUQUP009JQLD4ZRBZS', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'BYFDK23N06Y8', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, '2Z9615JLE2UIDCM7OD', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'SANR15W261T', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (256, 'NZ8EK6Z7CO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'QCO6X9ETFPG15BL2', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'VI9T9PFU02Y4M3P3PUUPE', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'IL3GL4T', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, '0BFMVYU3NOGELDTTJC', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, '2BSZUM5KAOR9G5GXMZ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'UQ0M7JMGK', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, '5K4EC6Y', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'DLTZVZJ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'S1E2GSVTJQ8FDCMKRRGI', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'UDWHX1O6B', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'XTKKXBLZZBX93GS', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'Z485XQ48L6M', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'XZPVJMYIMHH', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'MJJSR96LPHTNMZHIR8REL', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (257, 'Y0D4BUL8', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (258, 'WI6YVYO', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (258, 'AQ2LR5R14I', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (258, '2Z9615JLE2UIDCM7OD', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (258, 'WVYMG3GV', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (258, 'LN0AZUKE0A1TMT3GJ59', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (258, 'F56V57VNWTG0PEW', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (258, 'ZCDOKYIXEJ7UHB0WXVT', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'C2X22WDYBYOD8A1H8X9XC', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '4BQVNNGVBJ7GK5W121', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'PINOPOLHDJHEK', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '85JV1UMUHD0L52HHVV', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '8XJNZJMFJI937JIU064', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'SDUC8HE5XIPW5804', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'CBMBFZFMGFQQ', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'LYBLSUB7S10666J6VJOCJ', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'MJZ47QMOV', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'ILQNSNAUOE8', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'JVDOL8R', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'NIAUET3FH6CU', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '90K8LVI', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '1AHOY', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '7NFADWE0UFFHJAVV', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'UCVPPZOYXWYY1IQ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '67FYTY9BLZIR', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'PWJQE', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'CWO0WGF5R', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'I0K5BF0XOU8RRWJS', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '77ATEV', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, '0M2JXDCLZ0', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (259, 'R3HEM3T897D8B', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'Y88JFXE7I41E', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'CWO0WGF5R', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'VF3A3D', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'XLVYCBFBC03JVAQG', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'GF4IPWZXNXZNUJM', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, '981M45J7A6LBAE', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'LN0AZUKE0A1TMT3GJ59', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'VPKLW00GUMQ89S7QV', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, '8HBG25ODWXJT9ECAHI', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, '6D6JIDJKU2CCLYW', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, '6V4B2UHOK5ZM1OWYE8MV', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'QVA2UM9VYSWZ2VV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'YTT6USN5BCYA', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, '30OR6SWDE690', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'MUJZQQ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'N02AJ1BU62TVQAV', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'EIJ6PEH88HT81OTQ1', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'AJ92P9GU71', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'WUUPSVKB6AIT9P8FWBLB2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'P3MGNX9GXNNEJT', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'MK852YS1CMM', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'AQ2LR5R14I', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (260, 'RK0HL3Z5I7CG6Z9SNV8', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (261, '5A2HLJ6P', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (261, 'PRBQVB3CP8C', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (261, '5YXOUQ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (261, 'Z0ETQEE80W6', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (261, 'BHOXCIQ5EP4DJ34JF6', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (261, 'GF4IPWZXNXZNUJM', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (261, 'W7SM1', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (261, 'II6VD1', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (262, 'BKWTLRI9EO23T4J63345P', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (262, 'BW30ULX2XGPUPLP', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (263, '5ZAB582F4YY0U37NG6P', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (263, '2FMUFGLRHDZUFPYQ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'YUJ72682YR6XBDTDSKH', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'M70ZQD6N2FJQ1OJA', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'DX04DLJ1O', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, '7L9KY', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'DTJ3FON8UE3D95N4INSF', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'IP6EQZ7C4XWJFW4CF6', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'BHOXCIQ5EP4DJ34JF6', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'KU21KBD7E', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'Y88JFXE7I41E', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'FCU04Y3TF63OILE5RSL3', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'GU6848TQ4VA5R', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'XTKKXBLZZBX93GS', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, '21UGUUBNP1', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'PWJQE', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'BW30ULX2XGPUPLP', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, '6MA0OT1J2', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, '769C58JH910T5GZCLRT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'B732DEO', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'VNFQD1PRQSES92H', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'EGDFF193GSKZX', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'M79CEQBO', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, '949BZO', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, 'NB24TDA92', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (264, '2MS0C07CGKTC2', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'LN0AZUKE0A1TMT3GJ59', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'MJJSR96LPHTNMZHIR8REL', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'UYZQMXQED8H2TW', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'VPKLW00GUMQ89S7QV', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'CBMBFZFMGFQQ', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'B6L7BDOA', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'O8KRDW60J3K0XRHDT6XDT', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, '8JVZWM0IHY17XX', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'QSP89T0I9JLS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'V9FI47R25KVSIK', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (265, 'SANR15W261T', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (266, 'GS0MI64', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '7L9KY', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'X9QBYBID', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'CZFJ09QE', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '62IZOU76V1EPAPZ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'L14HL58UR82FUOI629TZJ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '2Z9615JLE2UIDCM7OD', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '2ITL25BIV7E2VW2THO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '699OPJEQ5B20HL07', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'LU89A', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'GVU0CP56W22SHL', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '02C91G77F9S3T', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '2MS0C07CGKTC2', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '9TD3D26HXZKO1G0HIE5', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'ZD2CRTD', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'C6TPIU7QZ4W3XY9', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'OVM4J', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '0BFMVYU3NOGELDTTJC', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'PWJQE', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'OQ3J8K5O6JQ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'VWF8C0OHLIHIST', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'Y3F7W49Z', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, '7SPGQCTJ83R7DVZD', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (267, 'YTT6USN5BCYA', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'VNFQD1PRQSES92H', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'N6S5S0', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'C4D6Z4B', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, '5XOH5', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'XK54KCGLQF9VX01VVB40', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'U9DHEPXBH4CDB', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'XHYK1', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'CZFJ09QE', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'M20NJW31JND', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (268, 'IRJVC7CDJH2UTY011', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, '67IEX5TA4Z39PC', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, 'VBMSWQECXWSDL7J', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, 'XHYK1', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, '7NFADWE0UFFHJAVV', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, 'UUSH3D8PB8YBW6Z', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, 'U9DHEPXBH4CDB', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, 'AJ92P9GU71', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, '4HUT9MXQB8PGY2KBAL', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, '8XJNZJMFJI937JIU064', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, 'M79CEQBO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, '21UGUUBNP1', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, 'C4XWVFZ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (269, 'HFO63EMAFK5M4V0PD5V8', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'WUUPSVKB6AIT9P8FWBLB2', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'ZD2CRTD', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'BVTXD071JBIUY', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'BW30ULX2XGPUPLP', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'D4U6ZK8KO3U9N', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, '22K2FGBX3B7MGM3D4U', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'VWF8C0OHLIHIST', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'PEVLRHGO05S1XOQFS6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'G1UEQBK09', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'AGCYAE21BNK19H', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'CNB4GX0R2UPU', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (270, 'GGWXZ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'CYMMQQMYEWRO6CB5XS9P', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'Q7YGYZ0S40T', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'EUEXHHLN3DBDUWM7', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'Y3F7W49Z', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '02C91G77F9S3T', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '288Y1JHE2K', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'Y5X3BG429E28TN', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '8XJNZJMFJI937JIU064', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'AQ2LR5R14I', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '0I8XSK1UG5C3X', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'BYPLGOFPQMJT', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '020UJRJD', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '67IEX5TA4Z39PC', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '67FYTY9BLZIR', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'AXF6A09GKL6POJ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '5QQQHCZ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'ETUSGK66QD61ZH3WOP8R', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'UXHLXFZRSKO', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, 'FZ56D1Q7Q', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (271, '21UGUUBNP1', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (272, 'PH7NZ3', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (272, '0I8XSK1UG5C3X', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (272, 'DX04DLJ1O', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (272, 'IVT7I9WFUVYNTDK', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (272, 'C4XWVFZ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (272, 'CBMBFZFMGFQQ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'AGCYAE21BNK19H', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'TNQ84HUOAXE', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'B6L7BDOA', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'SDWAOQL6ECL81FBZGH3Z8', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'LHK0T9S', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, '7NFADWE0UFFHJAVV', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'LYBLSUB7S10666J6VJOCJ', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'BUE03EPCMK5CN5W86K7', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, '56E0F3JOJJDS45YBX1N', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'SGDU4TYC3Z2CTBO02O', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'R7BSNEKS4IGM4OVIEXLK', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'XAT20KDG7EMM7', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'JRQQAAGBDRKLHTRGH7', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, '7ZNIARN4KATYPLOR', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, '949BZO', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'MF44FFETGVBGI2L506L', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'L14HL58UR82FUOI629TZJ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'KQSJZL6L31I5BAKXS', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'DLTZVZJ', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'YUJ72682YR6XBDTDSKH', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'JYSNDB7QNJ62KFLHS1IME', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (273, 'YN2SDTYRD0CIJ72KKJK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, '6OAUBOFNMM4799S88V', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'UEN7FUN', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'TS0AU', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, '7YNBEF', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'EUEXHHLN3DBDUWM7', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'DA9GT25X739M1Y0', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'B6L7BDOA', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'FQXWTL', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'C4D6Z4B', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'BHOXCIQ5EP4DJ34JF6', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'VNFQD1PRQSES92H', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, '07GN343YO8ISA6', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'SGDU4TYC3Z2CTBO02O', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'XZPVJMYIMHH', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'OVM4J', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, '3HHJP2PO2PP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, '1S7WS7PKONTWYWX4', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'APVBWS1XK7E', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'KZ9U1E2JUS9SMJ6TQ8K', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'C3FREM', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'KU21KBD7E', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'N1UTCLLRD5VJWEHDWBN6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, 'HHHDOHAVS0EO2K4RRS04', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (274, '0J7QVKSSD', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (275, 'VMHJQ7O5VWP92VZB2Z', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (275, '2GOYYZDWAU2NWJXLT', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (275, 'FZ56D1Q7Q', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'Z4QYNGYHM7GFKULCOI2UL', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, '1OV0H27YQSDB4', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'ASTLCU', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'S7GNQ742EN7', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'IRJVC7CDJH2UTY011', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, '0BFMVYU3NOGELDTTJC', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'HQRQELWCEHW', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'QIO1AG64EYG02PKZEF6', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'QYYXP', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, '53F6XOJ1JUIB', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'Z5OJ6ZTHT1O76CHLG9', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'UCVPPZOYXWYY1IQ', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'OOCLVBBZCZIG', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'FZ56D1Q7Q', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'D8TJJICNEOV82', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'X6W6X5GILAJ2', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, '2FMUFGLRHDZUFPYQ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'O8KRDW60J3K0XRHDT6XDT', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, '1JXH31GX8HUYX0IE83', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'RK0HL3Z5I7CG6Z9SNV8', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'C3FREM', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'I0OJ9748', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (276, 'HUFMZDU8S', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'JVDOL8R', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'Y883RPGH7U', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'ERZG9X', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'TNQ84HUOAXE', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'V2U95QBAM', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'FIIVD9380IDSKURUJ', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'WVYMG3GV', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'WV8XBDGHNU2CT6SY', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, '3EERUKR5EZZUJRL6', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (277, 'AJ92P9GU71', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (278, 'SJZRNHN', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (278, 'FT2JICD6YB8PA4B', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (278, 'ILQNSNAUOE8', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'II6VD1', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'N1UTCLLRD5VJWEHDWBN6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, '4BQVNNGVBJ7GK5W121', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, '3BVQ0WX4BBQRYZ0K3O0R', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'MQ8F85J465QUJDU4RLTD', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'NS1I9XWC', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'S1E2GSVTJQ8FDCMKRRGI', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, '3EERUKR5EZZUJRL6', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'MBEUPWPIHGRS4FJVF93QF', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'Z0ETQEE80W6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'F56V57VNWTG0PEW', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'GU6848TQ4VA5R', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, '3HHJP2PO2PP', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, '4HUT9MXQB8PGY2KBAL', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, '288Y1JHE2K', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (279, 'FYRZH2Y0AJ', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'AJ92P9GU71', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'O7QS8WMH8LONPN7YJ', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, '6LSVLO3ERNTRZJHG0G', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, '41UPBXWORKVV7PPAMXM', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'DX04DLJ1O', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'ZT29H850LSWEYUZ3SSAZU', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, '4Y6Z9X12', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'ILQNSNAUOE8', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'RK0HL3Z5I7CG6Z9SNV8', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, '5YJUXY2VSUV5XI5G3DIZ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'CJ8GR5XGB9XNXCW4LKME', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'ZQA56', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'XHYK1', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, '6WMZLW55AV0D86', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, '7UGDOWFW37N7HBK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, '7ZNIARN4KATYPLOR', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'GVU0CP56W22SHL', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, '8HBG25ODWXJT9ECAHI', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (280, 'N1CTQN1AEDWM04Q00', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'J6KSOE45K2VT2WS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'PEVLRHGO05S1XOQFS6', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, '32KLYLHKPTARYNOX44RGW', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'N6S5S0', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'BDAAVO', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'O8KRDW60J3K0XRHDT6XDT', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'MQC9YX5NTF169OM1', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, '3XFYKT1MPFV4KS9AT900', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'B5B2RB', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'CDQIS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, '3TGKD7HO9EKV69R0UIP', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (281, 'P3MGNX9GXNNEJT', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (282, 'HQRQELWCEHW', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (282, '13QF5RTP', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (282, 'SJZRNHN', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (282, '3C0DV9JO5RS5F', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (282, 'XTKKXBLZZBX93GS', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, 'WI6YVYO', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, 'CXWEZJ', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, '0I8XSK1UG5C3X', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, '981M45J7A6LBAE', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, '4L1DW5PKXJ55', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, 'KZ9U1E2JUS9SMJ6TQ8K', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, 'HHHDOHAVS0EO2K4RRS04', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, '8871TAL4EDLF5BCYGA5S', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (283, 'RRCVTYZQKRRBXM38CN1', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'WGPHLEQ', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'X6W6X5GILAJ2', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '2GOYYZDWAU2NWJXLT', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'MK852YS1CMM', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '3V23HB1NVU3YG8XT3A', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '0MWSLI7P1QKZZ4', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '3X7PR3QB8KHLPUC2Z', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'NZ8EK6Z7CO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '5X84IINRW', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'NS1I9XWC', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'L8R0R2CPTTN2Z0SQ55BV', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'MCD0BZ68ZBOUZ8', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '2CID2PM88ZLMUDAL', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'C4D6Z4B', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '2C67F990PDFNMH2KND', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'VPKLW00GUMQ89S7QV', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, 'D4PEN3PQOBHRL', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '07GN343YO8ISA6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (284, '8HBG25ODWXJT9ECAHI', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (285, 'MCD0BZ68ZBOUZ8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, 'AQ2LR5R14I', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, 'KZ9U1E2JUS9SMJ6TQ8K', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, 'FT2JICD6YB8PA4B', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, 'X6W6X5GILAJ2', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, '13QF5RTP', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, '5PQJ744', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, 'MLERQAU3CZW9Y3C', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, 'CM3XLMHENI7S8UOPK', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, 'FFL7CRM9T1TUNA4A3JK0', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, 'SJZRNHN', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, '3OPK3DH4ZI73RO', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (286, '41UPBXWORKVV7PPAMXM', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (287, '2Z9615JLE2UIDCM7OD', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (287, 'CXWEZJ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (287, 'O8UDLDAO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, '4Y6Z9X12', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'IL3GL4T', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'WA2I45YB7E6DG', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'PH7NZ3', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'XPCN0F1R4', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'HHHDOHAVS0EO2K4RRS04', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, '9GSJMDS78HQN', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'GS0MI64', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'JU7F89YBYG0OZOFS', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'R7BSNEKS4IGM4OVIEXLK', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, '589SANB', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'O8UDLDAO', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'EIJ6PEH88HT81OTQ1', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, '7ZNIARN4KATYPLOR', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, 'TS0AU', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (288, '2K7X7R3APTU1FDLSP84', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, 'IKPREAG', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, 'Y88JFXE7I41E', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, 'KHS02Q99V', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, 'ERZG9X', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, 'IP6EQZ7C4XWJFW4CF6', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, '5PQJ744', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, 'FNJP0CUCSX2G282D26L58', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, '6X9Q3TM0S18EFZG7', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, '62IZOU76V1EPAPZ', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, 'MCD0BZ68ZBOUZ8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (289, 'QCO6X9ETFPG15BL2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'RK0HL3Z5I7CG6Z9SNV8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, '981M45J7A6LBAE', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'B732DEO', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'MHBKQ5MZ0SH36X', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, '62IZOU76V1EPAPZ', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'M95K5K9QZ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'BKWTLRI9EO23T4J63345P', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, '7YNBEF', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, '9TD3D26HXZKO1G0HIE5', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'MF44FFETGVBGI2L506L', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'II6VD1', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, '2Z9615JLE2UIDCM7OD', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'C2X22WDYBYOD8A1H8X9XC', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'KFBBDJ2O', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'DA9GT25X739M1Y0', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, '2ITL25BIV7E2VW2THO', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'N55RS7PHXKJZ283K', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'FZ56D1Q7Q', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'DITF47NV9AH76', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (290, 'FFL7CRM9T1TUNA4A3JK0', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, '6LSVLO3ERNTRZJHG0G', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'WA25GWM', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, '6ZPFBD41AGJG629ELF', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, '02C91G77F9S3T', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, '7NFADWE0UFFHJAVV', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'BYFDK23N06Y8', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'NKUPQ7U18D994E', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'EA4RXFRYJTRY', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'KD57F', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, '1OV0H27YQSDB4', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'L1XOEG68Y1O9P', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'WA2I45YB7E6DG', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'GS0MI64', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, '6WMZLW55AV0D86', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'CYMMQQMYEWRO6CB5XS9P', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (291, 'BKWTLRI9EO23T4J63345P', 16);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (292, 'I0OJ9748', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (292, 'Y88JFXE7I41E', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (292, 'AJ7OC2KWG', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (292, 'NS1I9XWC', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (292, 'WI6YVYO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (292, 'A9ACTJAH3F', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (292, 'GVU0CP56W22SHL', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (293, 'Y3F7W49Z', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (293, 'AJ7OC2KWG', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (293, 'BDAAVO', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (293, 'JU7F89YBYG0OZOFS', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (293, 'N1UTCLLRD5VJWEHDWBN6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (293, '04GWNLKR', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (293, 'CBMBFZFMGFQQ', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (293, 'D4U6ZK8KO3U9N', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (294, 'NZ8EK6Z7CO', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (295, 'CDQIS', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (295, 'NIAUET3FH6CU', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (295, '1AHOY', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (295, 'C2X22WDYBYOD8A1H8X9XC', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (295, 'HQRQELWCEHW', 11);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (295, 'TNQ84HUOAXE', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (295, '4FQOB', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, '92RNQOWISW5Y9', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'OVM4J', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, '45E2D7MV4MJN0', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'MV6XK', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'P9K4TFHA36EYQVU', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, '1AHOY', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, '6WMZLW55AV0D86', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'O8KRDW60J3K0XRHDT6XDT', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'SCH5S98F9C9FLIBD1QX4', 3);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'CJ8GR5XGB9XNXCW4LKME', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'Z0XA0YOXAY6UO10', 1);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'C2X22WDYBYOD8A1H8X9XC', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'HSBGDO', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'WUUPSVKB6AIT9P8FWBLB2', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'WVYMG3GV', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, '85JV1UMUHD0L52HHVV', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'M70ZQD6N2FJQ1OJA', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'GS0MI64', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'SGDU4TYC3Z2CTBO02O', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'J5C70PD4F9807NC5', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, 'LU89A', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, '9LNGWY5DWNPA51K2', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (296, '2FMUFGLRHDZUFPYQ', 5);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'EUEXHHLN3DBDUWM7', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'V2U95QBAM', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'NZ8EK6Z7CO', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'JVDOL8R', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, '6LSVLO3ERNTRZJHG0G', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'AGCYAE21BNK19H', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, '5QQQHCZ', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, '4ASMEMPZMUTTPV', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'BUE03EPCMK5CN5W86K7', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, '6MA0OT1J2', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, '57VGLO', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, '4BQVNNGVBJ7GK5W121', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'WGPHLEQ', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'AQ2LR5R14I', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'D8TJJICNEOV82', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'SDUC8HE5XIPW5804', 4);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'CDQIS', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (297, 'CJ8GR5XGB9XNXCW4LKME', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, '6Q3GO4LPZG2E8LZQ7DUXY', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'PEVLRHGO05S1XOQFS6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'LYBLSUB7S10666J6VJOCJ', 18);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, '7NFADWE0UFFHJAVV', 14);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'IKPREAG', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'QYYXP', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'L1XOEG68Y1O9P', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'WPF946Y2FHYCJCVBZ5DS', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, '5EHJW01BU2OJ9JKJWAS', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, '3V23HB1NVU3YG8XT3A', 21);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'C3FREM', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'FCU04Y3TF63OILE5RSL3', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (298, 'W7SM1', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'MT9WD29UG1D8JKZXYHBR', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'LU89A', 20);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, '5FKZ5E1M87QESJ30Q', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, '8JVZWM0IHY17XX', 7);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'LN0AZUKE0A1TMT3GJ59', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'KFBBDJ2O', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'EK23AQZCHC1A', 15);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'RK0HL3Z5I7CG6Z9SNV8', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'KD57F', 2);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'M79CEQBO', 12);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'BHOXCIQ5EP4DJ34JF6', 13);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (299, 'H8JDI', 8);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (300, 'D5X3JMCXX', 19);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (300, '2228EKDSEF', 10);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (300, 'WA2I45YB7E6DG', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (300, 'ZGDI8EJIXNAIHAUG0V', 17);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (300, 'JWOG2WE8', 6);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (300, 'NZ8EK6Z7CO', 9);
INSERT INTO order_contents (order_id, serial_no, quantity)
    VALUES (300, 'VBMSWQECXWSDL7J', 10);
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Hood-Jones', 'michael54@yahoo.com', 2, 'Child wall front audience financial build.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Holloway PLC', 'vhopkins@gmail.com', 2, 'Teach much possible job beat seek financial.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Cooke, Robbins and Murray', 'colleenhaynes@gray-wade.info', 2, 'Court throw art.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Owen, Jones and Terrell', 'vhopkins@gmail.com', 3, 'Stock film cover without.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Johnson-Robbins', 'victoria89@yahoo.com', 3, 'Certainly need speak attack so movement commercial information.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Herrera, Park and Gallegos', 'zwhite@boyd.com', 1, 'Back big good field.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Wise-Smith', 'sacosta@li.com', 2, 'Yard at decision head reflect recognize exist house.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Shannon-Shaw', 'rmoore@hughes.com', 5, 'In all unit grow every audience.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Contreras, Lynch and Foster', 'luislane@gmail.com', 0, 'Choose act theory according team.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Vaughn PLC', 'vodonnell@griffin.biz', 2, 'Statement now middle moment wide radio.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Hale, Ford and Castillo', 'aliciaryan@miller.com', 5, 'Kid who main thus science care yet.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Hopkins, Castillo and Winters', 'prodriguez@yahoo.com', 1, 'Individual our morning painting teach.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Miller-Evans', 'snyderhailey@gmail.com', 1, 'Many loss discover pattern.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Williams, Sandoval and Chaney', 'kcarter@ramirez.com', 4, 'Court measure able city.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Martin PLC', 'michaelshort@woodward-houston.com', 1, 'Current always concern deal kitchen.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Manning Inc', 'tracy75@thomas.com', 2, 'Pay various anything current they.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Miller, Palmer and Brooks', 'snyderhailey@gmail.com', 1, 'Meet three mean security deal thousand real.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Case and Sons', 'brandondominguez@hotmail.com', 1, 'With reality middle style skill.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Cook Ltd', 'michael71@barajas.com', 0, 'Else six without five.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Holloway Ltd', 'fcoleman@gmail.com', 1, 'Yes thus until.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Lewis-Decker', 'christopherlane@hotmail.com', 6, 'Usually would government body receive.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Kennedy LLC', 'armstrongmatthew@yahoo.com', 4, 'Human consumer move become believe.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Franco Group', 'waltersmichelle@yahoo.com', 0, 'On admit green ago fact financial.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Carrillo-Wilson', 'jeremy89@hotmail.com', 1, 'We government stock risk defense threat at.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Williams, Davis and Powell', 'parkstacy@gmail.com', 6, 'Small worry produce himself head lot.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Garcia-Reed', 'michaelshort@woodward-houston.com', 4, 'Might major join who chair toward end.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Pearson, Griffin and Kerr', 'romerocaleb@crawford.com', 0, 'Politics book cultural.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Salazar, Hughes and Moreno', 'twillis@hotmail.com', 0, 'Say arm involve continue.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Stanton and Sons', 'pthomas@gmail.com', 4, 'Along care stuff same successful speech gun.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Gonzalez and Sons', 'bethanybailey@lozano.com', 4, 'Economy government trouble expect.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Lewis-Decker', 'armstrongmatthew@yahoo.com', 0, 'These myself career car assume.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Miller, Palmer and Brooks', 'hschmidt@nelson-gross.org', 5, 'Market board speech mention brother article degree.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Holloway Ltd', 'turnermichael@yahoo.com', 2, 'Capital study many conference ready cut idea.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Parsons, Mccarthy and Schneider', 'gary51@yahoo.com', 3, 'Resource mind about sister particular.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Peterson-Brown', 'tapiadavid@hall.com', 0, 'Prove degree edge.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Daugherty Inc', 'rachel68@yahoo.com', 5, 'However approach town big Democrat require property practice.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Wilson-Edwards', 'christiangutierrez@may.com', 1, 'Born phone group the simply.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Cantu-Carrillo', 'gallagherangel@pena-russell.com', 3, 'Despite story per necessary television else check born.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Adams-Taylor', 'william12@fisher.com', 4, 'Study we table today two computer rise market.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Villegas-Ramsey', 'kristin31@yahoo.com', 5, 'Garden more during they off.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Woodward-Miller', 'alyssa53@mcgrath.com', 5, 'Compare scientist catch perform difference issue tree.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Jackson Ltd', 'vhopkins@gmail.com', 0, 'Central turn current individual.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Wells-Perkins', 'mahoneyolivia@hotmail.com', 0, 'Them magazine suffer glass deal.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Lowe, Pacheco and Smith', 'charlesfoster@vega-mendoza.com', 6, 'Together including sea improve television month develop.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Adams-Taylor', 'lauren96@mosley.org', 5, 'Establish owner great miss yourself suffer improve light.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Torres-Morrow', 'michaelshort@woodward-houston.com', 6, 'Issue trial attack own its city.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Norman-Rivera', 'jenna75@gmail.com', 1, 'Model between budget.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Byrd, Gonzalez and Duncan', 'michael54@yahoo.com', 4, 'Put court finally as fund.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Vasquez and Sons', 'anthonyflowers@gmail.com', 1, 'Short significant soldier national.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Jones-Ortiz', 'javier78@berry.net', 1, 'Site rather commercial process suggest war now.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Brown-Jones', 'cindygonzalez@hotmail.com', 2, 'Church leg recognize court war know.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Wilson-Stout', 'yholmes@gmail.com', 3, 'Himself wrong modern not network pull.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Flowers, Young and Russell', 'johnsonkristina@yahoo.com', 3, 'Bank laugh ground eye administration break believe.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Contreras, Lynch and Foster', 'james62@yahoo.com', 4, 'Point finish before other.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Wells-Morales', 'colleenhaynes@gray-wade.info', 3, 'Value method sure commercial debate land.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Holloway PLC', 'grace48@garrett-garza.org', 4, 'Result a region better light respond.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Hernandez Ltd', 'josephsmith@robertson-gonzales.org', 5, 'Little pick at benefit financial six until.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Ford PLC', 'stefanie52@lucas.com', 6, 'Institution any last second film gun add.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Barnes, Gallagher and Black', 'uperez@hotmail.com', 1, 'Perform two grow at.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Anderson LLC', 'sean78@hodge.biz', 3, 'Beautiful four provide.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Johnson-Robbins', 'michaelshort@woodward-houston.com', 5, 'Available wind education else teach expert.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Tanner-Taylor', 'daviesashley@wells.com', 1, 'Charge evening by several father a we.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Case and Sons', 'cindygonzalez@hotmail.com', 2, 'Produce structure over.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Rodriguez Inc', 'walkeryvonne@gmail.com', 1, 'Cover plan can understand want ahead.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Villanueva-Maxwell', 'michael71@barajas.com', 6, 'Scientist far I generation low.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Nash, Woodard and Contreras', 'michael98@yahoo.com', 6, 'Already risk reason force worry prepare over.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Anderson Ltd', 'prodriguez@yahoo.com', 1, 'Month tonight body always onto support paper.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Short LLC', 'johnsonkristina@yahoo.com', 3, 'Former tell boy see.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Hale, Ford and Castillo', 'james82@hotmail.com', 1, 'Firm serious father hand off box us.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Bryant-Hernandez', 'tracy75@thomas.com', 2, 'However industry concern can upon wait.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Cook Ltd', 'yholmes@gmail.com', 3, 'Bed charge born short how open shoulder.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Lewis Inc', 'xhawkins@rowe.com', 5, 'Field agent minute set dinner maintain.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Cooke, Robbins and Murray', 'linda24@jones-compton.com', 2, 'Best guess wide whose various military early.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Williams, Davis and Powell', 'javier78@berry.net', 3, 'Bad ask bar section marriage vote house.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Smith Inc', 'uperez@hotmail.com', 3, 'Speak member shoulder radio.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Barron, Adams and Reilly', 'anthonyflowers@gmail.com', 3, 'Effect change for less fight vote either.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Collier Group', 'tracyscott@hardin-rodriguez.com', 5, 'Family say thousand image into.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Black LLC', 'iadams@proctor-hill.org', 5, 'Pm old economy.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Mcdowell LLC', 'rgonzalez@yahoo.com', 0, 'Tonight well project sport.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Campbell, Davidson and Jackson', 'sherioconnor@gmail.com', 6, 'Support across resource however.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Jackson Ltd', 'shaffermaria@yahoo.com', 0, 'Pretty night hand film sense coach around.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Barnes, Gallagher and Black', 'masseychristian@johnson.com', 2, 'Report to ready law.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('White, Martin and Brooks', 'waltersmichelle@yahoo.com', 6, 'Operation possible care continue success add shoulder.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Miller-Evans', 'hatfieldjimmy@douglas.net', 4, 'Important minute benefit whatever perhaps bed.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Yoder Group', 'cindygonzalez@hotmail.com', 5, 'Body address cup.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Franco Group', 'xbarker@gmail.com', 4, 'Cell computer talk difference.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Bates, Foster and Hart', 'allison69@gmail.com', 6, 'Understand hair candidate change.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Campbell, Davidson and Jackson', 'rmoore@hughes.com', 3, 'Manage high cell thus word that player.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Vaughn PLC', 'yholmes@gmail.com', 3, 'Exactly serious research spend major common week better.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Salazar, Morris and Carpenter', 'moyermelanie@aguilar.com', 5, 'Citizen most lead decision short hope whether.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Holloway Ltd', 'linda24@jones-compton.com', 0, 'Myself discover me.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Patel PLC', 'snydershaun@yahoo.com', 2, 'Section require number white.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Spencer, Brown and Murray', 'fstewart@frazier.com', 1, 'Traditional little moment their car different voice.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Davis, Bentley and Clark', 'williamskatherine@yahoo.com', 4, 'Story step stay network later.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Higgins Ltd', 'grace48@garrett-garza.org', 6, 'Open center part begin find already hour east.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Washington-Gonzalez', 'alvaradomeghan@yahoo.com', 5, 'Before business world whom.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Williams PLC', 'luislane@gmail.com', 2, 'Class another red science teacher line.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Arnold, Rivera and Moyer', 'clarkjonathan@yahoo.com', 0, 'Happen character newspaper matter church them environment.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Gilbert, Bennett and Gutierrez', 'klinelinda@gallegos.org', 1, 'Factor effect state brother and tax list.');
INSERT INTO store_review (
        store_name,
        reviewer_email,
        rating,
        review
    ) VALUES ('Vazquez-Lutz', 'eperez@hotmail.com', 5, 'Debate may others can.');
INSERT INTO wishlist (serial_no, email)
    VALUES ('RI5SPSRSS1R29UB', 'eperez@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('WPF946Y2FHYCJCVBZ5DS', 'dwilliams@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('L3IIEMC1WYM3W1KGXQ9R1', 'sean78@hodge.biz');
INSERT INTO wishlist (serial_no, email)
    VALUES ('ETUSGK66QD61ZH3WOP8R', 'williamssarah@hughes-hill.org');
INSERT INTO wishlist (serial_no, email)
    VALUES ('KFBBDJ2O', 'ecooper@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('TS0AU', 'esmith@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('67FYTY9BLZIR', 'amy28@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('PWJQE', 'nconner@parker.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('02C91G77F9S3T', 'zwhite@boyd.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('3XFYKT1MPFV4KS9AT900', 'jmyers@wright-mitchell.org');
INSERT INTO wishlist (serial_no, email)
    VALUES ('13URU71I0ET52TX', 'seanthompson@schneider.net');
INSERT INTO wishlist (serial_no, email)
    VALUES ('R3HEM3T897D8B', 'vgarcia@hodge.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('2MS0C07CGKTC2', 'masseychristian@johnson.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('Y2Y4H', 'brandon64@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('N1CTQN1AEDWM04Q00', 'sstanton@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('B6L7BDOA', 'kcarter@ramirez.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('MUJZQQ', 'paulaskinner@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('O8UDLDAO', 'oliviawallace@duncan-west.biz');
INSERT INTO wishlist (serial_no, email)
    VALUES ('3C0DV9JO5RS5F', 'seanthompson@schneider.net');
INSERT INTO wishlist (serial_no, email)
    VALUES ('LU89A', 'gary51@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('RI5SPSRSS1R29UB', 'brandondominguez@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('XTYF9MP6T4E8C3P2R2VJ', 'mathiskeith@white.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('W22SIT2WXELR', 'waltersmichelle@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('Z4QYNGYHM7GFKULCOI2UL', 'luislane@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('UQ0M7JMGK', 'wmcconnell@brown.org');
INSERT INTO wishlist (serial_no, email)
    VALUES ('3TGKD7HO9EKV69R0UIP', 'comptonalan@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('6X9Q3TM0S18EFZG7', 'rgonzalez@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('L14HL58UR82FUOI629TZJ', 'anthonyflowers@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('TS0AU', 'parkstacy@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('YTT6USN5BCYA', 'julie67@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('Z0XA0YOXAY6UO10', 'michael71@barajas.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('FZ56D1Q7Q', 'kgalvan@fisher.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('LN0AZUKE0A1TMT3GJ59', 'michael71@barajas.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('FT2JICD6YB8PA4B', 'walkeryvonne@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('UEN7FUN', 'jenniferroy@osborne.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('DX04DLJ1O', 'hschmidt@nelson-gross.org');
INSERT INTO wishlist (serial_no, email)
    VALUES ('SCH5S98F9C9FLIBD1QX4', 'hlee@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('L3IIEMC1WYM3W1KGXQ9R1', 'allison69@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('5YJUXY2VSUV5XI5G3DIZ', 'smithtommy@brown.biz');
INSERT INTO wishlist (serial_no, email)
    VALUES ('OWP3D0V', 'xbarker@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('86WVI35UB8ONK4BG92', 'edwardsjonathan@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('0BFMVYU3NOGELDTTJC', 'vgarcia@hodge.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('Y883RPGH7U', 'alicia26@jones-farmer.net');
INSERT INTO wishlist (serial_no, email)
    VALUES ('N6S5S0', 'benjamin58@ward.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('92RNQOWISW5Y9', 'brandondominguez@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('3QM188FD73U', 'brandondominguez@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('CZFJ09QE', 'dbrown@arroyo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('N02AJ1BU62TVQAV', 'jmyers@wright-mitchell.org');
INSERT INTO wishlist (serial_no, email)
    VALUES ('QSP89T0I9JLS', 'cgomez@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('JYSNDB7QNJ62KFLHS1IME', 'kimberlyreed@baldwin-scott.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('AXF6A09GKL6POJ', 'riverajoshua@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('YN2SDTYRD0CIJ72KKJK', 'iadams@proctor-hill.org');
INSERT INTO wishlist (serial_no, email)
    VALUES ('Y3F7W49Z', 'josephsmith@robertson-gonzales.org');
INSERT INTO wishlist (serial_no, email)
    VALUES ('CNB4GX0R2UPU', 'rmoore@hughes.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('SJZRNHN', 'vgarcia@hodge.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('2228EKDSEF', 'kgalvan@fisher.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('5ZAB582F4YY0U37NG6P', 'fcoleman@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('4HUT9MXQB8PGY2KBAL', 'kallen@frye-dawson.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('CIAALP', 'othomas@vazquez.info');
INSERT INTO wishlist (serial_no, email)
    VALUES ('ET1Q87U38A3MJ', 'ginarusso@drake-miller.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('MHBKQ5MZ0SH36X', 'johnsonkyle@porter.biz');
INSERT INTO wishlist (serial_no, email)
    VALUES ('53F6XOJ1JUIB', 'brandon64@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('4FQOB', 'alisonmichael@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('AJ92P9GU71', 'vicki85@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('W22SIT2WXELR', 'cindygonzalez@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('9QH77BNMAK30A6TET3UK', 'andersonmatthew@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('HXQOFUOQ', 'chad36@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('77ATEV', 'nancyclark@yahoo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('2GOYYZDWAU2NWJXLT', 'allison69@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('288Y1JHE2K', 'eperez@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('B732DEO', 'brenda23@schaefer-jenkins.biz');
INSERT INTO wishlist (serial_no, email)
    VALUES ('2GOYYZDWAU2NWJXLT', 'esmith@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('699OPJEQ5B20HL07', 'acuevas@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('FCU04Y3TF63OILE5RSL3', 'acuevas@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('PLUBPMU7S9ZQ', 'dbrown@arroyo.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('AXF6A09GKL6POJ', 'kmitchell@dorsey.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('N02AJ1BU62TVQAV', 'johnsonrobert@hotmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('VBMSWQECXWSDL7J', 'mathiskeith@white.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('L49FNMBCD33DD', 'wileylisa@gmail.com');
INSERT INTO wishlist (serial_no, email)
    VALUES ('N1CTQN1AEDWM04Q00', 'turnermichael@yahoo.com');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('CDQIS', 'tapiadavid@hall.com', 2, 'Let democratic company just there last campaign sell.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('VF0W3NHMB0IO6T627B', 'vicki85@yahoo.com', 3, 'Create consumer should small glass.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('SDWAOQL6ECL81FBZGH3Z8', 'zwest@williams.com', 5, 'Experience too manager bag your audience.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('769C58JH910T5GZCLRT', 'ecooper@yahoo.com', 0, 'Make sign good agency local drop anything.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('13QF5RTP', 'fcoleman@gmail.com', 5, 'Still artist five show.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('T2U50QCMRBF6F1275GCO5', 'peter44@yu.com', 2, 'Off likely however dog this tree.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('G1UEQBK09', 'amyjohnson@gmail.com', 1, 'Arm range stuff him maybe.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('IVT7I9WFUVYNTDK', 'armstrongmatthew@yahoo.com', 4, 'Not tend lawyer speech throw.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('8871TAL4EDLF5BCYGA5S', 'slawson@fisher.com', 3, 'Model less foot quickly.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('7L9KY', 'brandon64@hotmail.com', 1, 'Eye right race no drop evidence official.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('23CWHYK', 'oliviawallace@duncan-west.biz', 6, 'Movement goal long.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('3EERUKR5EZZUJRL6', 'daniel43@nelson.biz', 2, 'Investment thought red account prepare.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('WGPHLEQ', 'alvaradomeghan@yahoo.com', 3, 'Walk treat have place heart deep happen.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('T2U50QCMRBF6F1275GCO5', 'johnsonmichael@gmail.com', 0, 'Ready evidence almost open benefit response especially.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('LFZV37F28', 'cooperroy@weaver.info', 2, 'Away according offer plant us suffer.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('P9K4TFHA36EYQVU', 'anthonyflowers@gmail.com', 3, 'Ahead tough law hold would.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('S7GNQ742EN7', 'ecooper@yahoo.com', 1, 'Artist nor per wall.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('L1XOEG68Y1O9P', 'amy28@hotmail.com', 1, 'Enjoy serious above station.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('HQRQELWCEHW', 'johnschultz@hotmail.com', 1, 'Opportunity put inside run particular push.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('RK0HL3Z5I7CG6Z9SNV8', 'browncindy@cross-welch.com', 0, 'Power pay huge Mrs game down floor.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('LN0AZUKE0A1TMT3GJ59', 'myersmark@hotmail.com', 3, 'Cause finish operation her town why.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('D4PEN3PQOBHRL', 'sean78@hodge.biz', 4, 'Spring specific action treat.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('90K8LVI', 'othomas@vazquez.info', 5, 'Resource wait across change tell state true over.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('MUJZQQ', 'slawson@fisher.com', 0, 'Off sound board baby network know.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('32KLYLHKPTARYNOX44RGW', 'armstrongmatthew@yahoo.com', 1, 'Finish environment street prepare I environmental.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('Y3F7W49Z', 'samantha06@osborne-williams.org', 5, 'Democratic service less project four.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('D4PEN3PQOBHRL', 'rgonzalez@yahoo.com', 1, 'Southern support star arm choose.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('B6L7BDOA', 'moyermelanie@aguilar.com', 0, 'Ground job read indicate leave mission option.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('UFILA9KZ2QEMYG76', 'vgarcia@hodge.com', 6, 'For protect claim run cut hundred study.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('L14HL58UR82FUOI629TZJ', 'lanejoan@taylor.info', 2, 'Ball doctor energy.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('7SPGQCTJ83R7DVZD', 'johnsonrobert@hotmail.com', 6, 'Expert policy worry.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('KQSJZL6L31I5BAKXS', 'clarkjonathan@yahoo.com', 3, 'Federal term end example together significant.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5A2HLJ6P', 'zwhite@boyd.com', 6, 'Simply activity want it wind.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('EK23AQZCHC1A', 'williamsheather@morales-brooks.biz', 6, 'Certain game matter.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('PRBQVB3CP8C', 'johnschultz@hotmail.com', 5, 'Home different message none give me capital.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5FKZ5E1M87QESJ30Q', 'psmith@olson-jones.com', 2, 'Somebody not start live road finish.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('3OPK3DH4ZI73RO', 'joseph67@gmail.com', 3, 'Identify near thousand third.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('R3HEM3T897D8B', 'nconner@parker.com', 5, 'Foot indicate mother stuff civil.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('T2U50QCMRBF6F1275GCO5', 'derek64@yahoo.com', 5, 'Level four spend.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('LYBLSUB7S10666J6VJOCJ', 'johnsonmichael@gmail.com', 4, 'Always down prove myself.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('HQRQELWCEHW', 'sacosta@li.com', 5, 'Body rate six growth bed mother early world.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('CWO0WGF5R', 'derek64@yahoo.com', 4, 'Piece leg establish skill item threat court.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5EHJW01BU2OJ9JKJWAS', 'kmitchell@dorsey.com', 4, 'Sister card itself almost.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('UPT1C', 'james62@yahoo.com', 5, 'During field training nation good.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5EHJW01BU2OJ9JKJWAS', 'alicia26@jones-farmer.net', 1, 'Economy office travel event deep plant.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('O17E3BH6NFU', 'pthomas@gmail.com', 4, 'Walk use growth data east.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('KRTZOJ6JKK3X7ZM', 'pcoleman@gmail.com', 0, 'Affect garden now gas week bed.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('97N27TIYC', 'erikagutierrez@gmail.com', 5, 'Forget left country indicate quality rather no.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('CDQIS', 'vancenathan@rojas.com', 3, 'Record outside pull.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('T2U50QCMRBF6F1275GCO5', 'snyderhailey@gmail.com', 6, 'Read specific able of deep southern wish.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('2228EKDSEF', 'tdominguez@jensen.biz', 4, 'Born relate low speech use hold billion.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('90K8LVI', 'julie67@hotmail.com', 2, 'Blood start still baby attack sometimes.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('LYBLSUB7S10666J6VJOCJ', 'javier78@berry.net', 6, 'Central yet anyone market put stand cause she.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('D31Z42Z', 'alicia26@jones-farmer.net', 1, 'Until quality specific travel suffer.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('SGDU4TYC3Z2CTBO02O', 'cgomez@yahoo.com', 4, 'Develop against college wall foot.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('9DGZDOJSMHYA', 'skaufman@thomas.com', 0, 'Ready child front crime protect.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('VMHJQ7O5VWP92VZB2Z', 'wileylisa@gmail.com', 4, 'Light break up still itself future research.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5EHJW01BU2OJ9JKJWAS', 'riverajoshua@hotmail.com', 4, 'New common forward condition same.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('CBMBFZFMGFQQ', 'zwest@williams.com', 0, 'Different top over fear country term.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('NIAUET3FH6CU', 'linda24@jones-compton.com', 4, 'Main bit discover responsibility trouble ability financial role.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('0I8XSK1UG5C3X', 'alyssa53@mcgrath.com', 5, 'Or father individual always but animal talk smile.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('1AHOY', 'jmyers@wright-mitchell.org', 4, 'Itself oil want place.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('KU21KBD7E', 'hlee@yahoo.com', 4, 'Wind magazine pressure true.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('D4U6ZK8KO3U9N', 'coxangela@jones.com', 5, 'Identify authority walk author enter edge.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('V9FI47R25KVSIK', 'slawson@fisher.com', 6, 'Doctor produce science color.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('XHYK1', 'ginarusso@drake-miller.com', 6, 'Human Republican appear but design director.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('2K7X7R3APTU1FDLSP84', 'anthonyflowers@gmail.com', 2, 'Generation investment military could protect.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('3EERUKR5EZZUJRL6', 'parkstacy@gmail.com', 3, 'Condition kid bar left cut agree article.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('HUFMZDU8S', 'jenna75@gmail.com', 0, 'Itself once fear themselves.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('UQ0M7JMGK', 'johnsonchristopher@yahoo.com', 2, 'Cultural common learn both site office student participant.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('RRCVTYZQKRRBXM38CN1', 'johnsonchristopher@yahoo.com', 1, 'Upon culture painting other offer.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('P8YT53FSZ0KG', 'rcraig@yahoo.com', 2, 'Born involve type.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('699OPJEQ5B20HL07', 'armstrongmatthew@yahoo.com', 6, 'Fire whom star point.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('ERZG9X', 'maryortiz@wright-wilson.biz', 3, 'Beyond return be civil.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('RSO05ATN6DZQ9I', 'tchen@hernandez.com', 5, 'Vote watch think personal around society.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('PPA2QBF2G', 'hatfieldjimmy@douglas.net', 5, 'Walk election buy thought program response government.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('YTT6USN5BCYA', 'williamsfrederick@payne.com', 3, 'Stuff today top large dog skin military little.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('13URU71I0ET52TX', 'samantha06@osborne-williams.org', 0, 'Enter industry traditional tough drop.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('LGHJM2WK9TCOOI4MJEE', 'alyssa53@mcgrath.com', 0, 'Project big story.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('66S4EM2P', 'victoria89@yahoo.com', 0, 'Put family watch main agent.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('BDAAVO', 'chad36@hotmail.com', 5, 'Reflect there fact sort dinner.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5IBBA7O5O7HU08J', 'cooperroy@weaver.info', 1, 'Push fire reality new.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('UA827GA6WFRTQ2', 'twillis@hotmail.com', 3, 'Party table catch feel like.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('Y88JFXE7I41E', 'bartonshelley@hotmail.com', 1, 'Particular hand lot art marriage.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('2GOYYZDWAU2NWJXLT', 'james62@yahoo.com', 2, 'Any explain finish.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('0MWSLI7P1QKZZ4', 'pcoleman@gmail.com', 2, 'Area alone wide than where whom phone gas.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('WUUPSVKB6AIT9P8FWBLB2', 'vancenathan@rojas.com', 6, 'Fish able themselves pass case truth.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('RRCVTYZQKRRBXM38CN1', 'tracyscott@hardin-rodriguez.com', 3, 'Dog option these able.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('4L1DW5PKXJ55', 'johnsonkyle@porter.biz', 2, 'Rate down lawyer building area opportunity.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('3BVQ0WX4BBQRYZ0K3O0R', 'bryanttracy@bruce-brown.com', 4, 'Join condition station table true wait phone.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('PH7NZ3', 'aliciaryan@miller.com', 0, 'Appear impact stay somebody heavy.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('JYSNDB7QNJ62KFLHS1IME', 'williamssarah@hughes-hill.org', 6, 'Discover behind raise.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('PH7NZ3', 'lauren96@mosley.org', 1, 'Fight director only nearly value.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('N1CTQN1AEDWM04Q00', 'sherioconnor@gmail.com', 2, 'Close husband left.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('2BSZUM5KAOR9G5GXMZ', 'othomas@vazquez.info', 3, 'Room type modern my put still term language.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('WGPHLEQ', 'daviesashley@wells.com', 0, 'Least ready us method own play traditional.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('A2EPH58ZDGO7J', 'nconner@parker.com', 0, 'Attorney in follow sit less sometimes direction.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('LFZV37F28', 'jennifer30@hotmail.com', 2, 'Cold not house themselves.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('SCH5S98F9C9FLIBD1QX4', 'clarkjonathan@yahoo.com', 4, 'Maintain main discussion military.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('BH5BATRJWJY', 'zwest@williams.com', 1, 'Site hit PM star simple speak.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('288Y1JHE2K', 'vgarcia@hodge.com', 6, 'Money easy per economic technology positive.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('UDWHX1O6B', 'vincenttaylor@gonzalez-austin.com', 1, 'Within style stay fire.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('UVVHVAESPAV8HXMX45', 'joseph67@gmail.com', 1, 'Just lead easy.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('NZ8EK6Z7CO', 'yholmes@gmail.com', 0, 'Site many name science.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('22K2FGBX3B7MGM3D4U', 'philip98@bishop.com', 4, 'Miss according skill senior manager explain how girl.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('KHS02Q99V', 'othomas@vazquez.info', 2, 'Build paper task indicate dinner take themselves.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('GFN4N4GWD', 'klinelinda@gallegos.org', 5, 'Become individual keep beat.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('Y2N0RN', 'tchen@hernandez.com', 5, 'Laugh east yet education.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('2SW2XT1PPYX', 'yholmes@gmail.com', 4, 'Reason fund wrong measure on.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('FT2JICD6YB8PA4B', 'alisonmichael@yahoo.com', 4, 'Language true prove that camera southern officer itself.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('YUJ72682YR6XBDTDSKH', 'luislane@gmail.com', 3, 'Could simply lead minute position mind practice.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('WQHR6DBMU6W3IJGNIEXF', 'psmith@olson-jones.com', 1, 'President east commercial shoulder.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('FNJP0CUCSX2G282D26L58', 'tracy75@thomas.com', 2, 'Suffer respond type sing drop.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('VF0W3NHMB0IO6T627B', 'melissaadams@gonzalez-mcdowell.biz', 4, 'Hand picture itself recognize well.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('FIIVD9380IDSKURUJ', 'johnsonkyle@porter.biz', 3, 'Discuss maybe scientist claim candidate big.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('M79CEQBO', 'johnsonrobert@hotmail.com', 0, 'List behind turn whether art must two.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('6V4B2UHOK5ZM1OWYE8MV', 'reesegabriel@hotmail.com', 6, 'Win person oil kid lead wear performance.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('BDAAVO', 'vodonnell@griffin.biz', 3, 'Song something social stage training.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('XMMDEQZECUBMWVS8', 'allison69@gmail.com', 5, 'Something pattern music feeling.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('WPF946Y2FHYCJCVBZ5DS', 'eperez@hotmail.com', 5, 'Eat responsibility record environment pattern.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('WA25GWM', 'jmyers@wright-mitchell.org', 4, 'Produce artist between guy house practice.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('VI9T9PFU02Y4M3P3PUUPE', 'bryantjeffery@yahoo.com', 4, 'Nothing while see once.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('XZPVJMYIMHH', 'wileylisa@gmail.com', 3, 'Her middle understand wonder from very.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('CNB4GX0R2UPU', 'kallen@frye-dawson.com', 4, 'Professional religious skill six.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('VF0W3NHMB0IO6T627B', 'twillis@hotmail.com', 5, 'Citizen after PM beyond house during less.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('MF44FFETGVBGI2L506L', 'jenna75@gmail.com', 1, 'Everything bar view expect new.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('ILQNSNAUOE8', 'oliviawallace@duncan-west.biz', 1, 'Ask house him focus around ask.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('N1UTCLLRD5VJWEHDWBN6', 'slawson@fisher.com', 3, 'Decision music believe finish baby yeah individual.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('D4U6ZK8KO3U9N', 'slawson@fisher.com', 3, 'Part than allow hear local federal adult.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('62IZOU76V1EPAPZ', 'alisonmichael@yahoo.com', 0, 'Partner safe consumer strategy his increase.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('M70ZQD6N2FJQ1OJA', 'bethanybailey@lozano.com', 3, 'Stuff true much speak.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('2SW2XT1PPYX', 'jennifer30@hotmail.com', 4, 'College through often.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('8XJNZJMFJI937JIU064', 'twillis@hotmail.com', 3, 'Often better son many.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('B732DEO', 'tdominguez@jensen.biz', 1, 'Social any woman.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5EHJW01BU2OJ9JKJWAS', 'paulaskinner@gmail.com', 4, 'Society want opportunity chair there.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('QQEYO7KC8BSL5FJ', 'dbrown@arroyo.com', 0, 'Accept fire study church.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('2I43566IFBO', 'romerocaleb@crawford.com', 1, 'Reason always hit along case spend carry.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('UA827GA6WFRTQ2', 'linda24@jones-compton.com', 5, 'Teacher mention risk rest from agree.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('0M2JXDCLZ0', 'stefanie52@lucas.com', 4, 'Good arrive range.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('WI6YVYO', 'romerocaleb@crawford.com', 4, 'Especially world fund light.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('F56V57VNWTG0PEW', 'gary51@yahoo.com', 4, 'Sea have art according simple nothing long set.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('FQXWTL', 'dbrown@arroyo.com', 1, 'Dog admit culture subject situation mention least.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('RSO05ATN6DZQ9I', 'johnsonkyle@porter.biz', 5, 'Course soldier office nor may.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('7Q5BDZTTRD9ESU2G', 'edwardsjonathan@hotmail.com', 5, 'Happen art coach exist.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('62IZOU76V1EPAPZ', 'xmyers@hotmail.com', 6, 'Staff guess safe team such billion.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('07GN343YO8ISA6', 'tchen@hernandez.com', 0, 'Yet carry after.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('FNJP0CUCSX2G282D26L58', 'jennifer30@hotmail.com', 3, 'Stop site window still.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('R7BSNEKS4IGM4OVIEXLK', 'tracyscott@hardin-rodriguez.com', 2, 'Citizen where stuff our last.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('VF3A3D', 'michaelshort@woodward-houston.com', 6, 'Approach subject decision see.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('NKUPQ7U18D994E', 'tchen@hernandez.com', 4, 'Market upon part beat.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('LGHJM2WK9TCOOI4MJEE', 'pthomas@gmail.com', 6, 'Wish imagine generation movement.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('W22SIT2WXELR', 'vodonnell@griffin.biz', 3, 'Both start project hour artist win.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('4L1DW5PKXJ55', 'kimberlyreed@baldwin-scott.com', 6, 'Site if onto wrong eye office single.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('589SANB', 'pittmannicholas@hotmail.com', 0, 'Serve their one.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('OWP3D0V', 'erikagutierrez@gmail.com', 5, 'Surface paper song want sister development.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('67FYTY9BLZIR', 'zwest@williams.com', 2, 'Detail all itself prove.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('PEVLRHGO05S1XOQFS6', 'pthomas@gmail.com', 5, 'Identify past real environmental language white.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('TZYP10H0544', 'james82@hotmail.com', 1, 'Cultural agent nation base sometimes evening.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5XOH5', 'kallen@frye-dawson.com', 6, 'Glass writer pull color.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('EIJ6PEH88HT81OTQ1', 'javier78@berry.net', 2, 'Political try decade issue discuss how last.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('FNJP0CUCSX2G282D26L58', 'ecooper@yahoo.com', 3, 'Month seven huge southern civil knowledge.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('VNFQD1PRQSES92H', 'vincenttaylor@gonzalez-austin.com', 3, 'Design young decision section check sea send.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('53F6XOJ1JUIB', 'brandondominguez@hotmail.com', 6, 'Can blue myself result deal but.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5XOH5', 'linda24@jones-compton.com', 0, 'Century another identify daughter add recently tonight.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('BYPLGOFPQMJT', 'samantha06@osborne-williams.org', 4, 'Kitchen each cause almost doctor country.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('6ZPFBD41AGJG629ELF', 'colleenhaynes@gray-wade.info', 0, 'Well million music current size dog.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('949BZO', 'hlee@yahoo.com', 4, 'Performance program mother everyone.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('2I43566IFBO', 'moyermelanie@aguilar.com', 6, 'Figure across house film.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('9QH77BNMAK30A6TET3UK', 'michael54@yahoo.com', 1, 'Occur can want prove north baby from.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('D5X3JMCXX', 'michael54@yahoo.com', 1, 'Avoid peace animal book director impact.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('36T1VGU3G0LYF', 'amyjohnson@gmail.com', 1, 'Available much least walk campaign result evidence her.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('HFO63EMAFK5M4V0PD5V8', 'amyjohnson@gmail.com', 5, 'Consider tough hospital with effect sort.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('MKO9QET3HY7P', 'sean78@hodge.biz', 0, 'Collection majority nature.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('S7GNQ742EN7', 'michael54@yahoo.com', 1, 'Congress claim Republican answer.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('Y3F7W49Z', 'james82@hotmail.com', 0, 'Process pull music record space watch.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('MK852YS1CMM', 'reesegabriel@hotmail.com', 6, 'Author citizen rest more quickly social.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('O7QS8WMH8LONPN7YJ', 'colleenhaynes@gray-wade.info', 4, 'Remain table site.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('HFO63EMAFK5M4V0PD5V8', 'turnermichael@yahoo.com', 5, 'Message gun so nearly significant seek.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('P8YT53FSZ0KG', 'williamskatherine@yahoo.com', 0, 'Career game prepare game figure after decade.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('C2X22WDYBYOD8A1H8X9XC', 'colleenhaynes@gray-wade.info', 2, 'List knowledge plan.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('HFO63EMAFK5M4V0PD5V8', 'comptonalan@yahoo.com', 4, 'Knowledge describe modern face.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('4FQOB', 'esmith@hotmail.com', 1, 'Similar those year movement probably benefit.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5XOH5', 'johnsonkristina@yahoo.com', 0, 'Dark short rock public window.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('3C0DV9JO5RS5F', 'brandon64@hotmail.com', 6, 'Ok keep behavior need.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('VF0W3NHMB0IO6T627B', 'turnermichael@yahoo.com', 1, 'Let stand statement early agreement among there.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('WUUPSVKB6AIT9P8FWBLB2', 'vicki85@yahoo.com', 0, 'More into analysis own ever street statement.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('O8UDLDAO', 'christopherlane@hotmail.com', 1, 'Again pretty brother behavior.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('ET1Q87U38A3MJ', 'williamssarah@hughes-hill.org', 5, 'State interest edge hold half under our until.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('5PQJ744', 'daviesashley@wells.com', 2, 'Authority light side learn.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('6D6JIDJKU2CCLYW', 'alicia64@moran.com', 5, 'Military million agreement quality your summer.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('97QPRUTYL', 'rgonzalez@yahoo.com', 0, 'Realize evening soon peace reason modern season thank.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('I0K5BF0XOU8RRWJS', 'dwilliams@yahoo.com', 2, 'Perhaps public stop subject factor international.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('UPT1C', 'julie67@hotmail.com', 6, 'Police behavior up similar happy poor short.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('FT2JICD6YB8PA4B', 'ginarusso@drake-miller.com', 4, 'Positive president argue.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('3TGKD7HO9EKV69R0UIP', 'johnsonrobert@hotmail.com', 4, 'Structure mother at series sport strong almost organization.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('QQEYO7KC8BSL5FJ', 'armstrongmatthew@yahoo.com', 1, 'Tough how until.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('4BQVNNGVBJ7GK5W121', 'jonathandavis@rodriguez-webster.com', 0, 'Traditional process manager suddenly manager continue book.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('3V23HB1NVU3YG8XT3A', 'christopherlane@hotmail.com', 1, 'Process more take blood deep cultural modern.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('PWJQE', 'vodonnell@griffin.biz', 2, 'Wonder surface floor pay.');
INSERT INTO item_review (
        serial_no,
        reviewer_email,
        rating,
        review
    ) VALUES ('67IEX5TA4Z39PC', 'brenda23@schaefer-jenkins.biz', 3, 'Next within join they sister.');
INSERT INTO coupon (discount, serial_no, email) VALUES (92, '981M45J7A6LBAE', 'psmith@olson-jones.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (22, 'SGDU4TYC3Z2CTBO02O', 'kmitchell@dorsey.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (89, 'QIO1AG64EYG02PKZEF6', 'lanejoan@taylor.info');
INSERT INTO coupon (discount, serial_no, email) VALUES (14, 'SJZRNHN', 'jeremy89@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (93, 'FFL7CRM9T1TUNA4A3JK0', 'xbarker@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (25, 'AQ2LR5R14I', 'tracy75@thomas.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (81, 'X6W6X5GILAJ2', 'zachary98@lee.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (66, 'W4GWGW5T9D8MKGC23', 'melissaadams@gonzalez-mcdowell.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (81, 'J6KSOE45K2VT2WS', 'riverajoshua@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (80, '86WVI35UB8ONK4BG92', 'vgarcia@hodge.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (27, 'IP6EQZ7C4XWJFW4CF6', 'philip98@bishop.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (58, 'AGCYAE21BNK19H', 'jeremy89@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (66, 'NB24TDA92', 'stevenwright@barnes-vargas.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (57, 'IP6EQZ7C4XWJFW4CF6', 'vodonnell@griffin.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (93, '769C58JH910T5GZCLRT', 'jmyers@wright-mitchell.org');
INSERT INTO coupon (discount, serial_no, email) VALUES (4, 'XK54KCGLQF9VX01VVB40', 'josephsmith@robertson-gonzales.org');
INSERT INTO coupon (discount, serial_no, email) VALUES (54, 'EIJ6PEH88HT81OTQ1', 'sstanton@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (61, 'KRTZOJ6JKK3X7ZM', 'christopherlane@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (37, '92RNQOWISW5Y9', 'esmith@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (74, 'KU21KBD7E', 'mahoneyolivia@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (88, '3TGKD7HO9EKV69R0UIP', 'mathiskeith@white.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (14, 'UEN7FUN', 'ginarusso@drake-miller.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (88, 'D8TJJICNEOV82', 'tracy75@thomas.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (61, 'OVM4J', 'chad36@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (91, 'S1K5SO8KVT5DEA1', 'hlee@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (54, 'WV8XBDGHNU2CT6SY', 'klinelinda@gallegos.org');
INSERT INTO coupon (discount, serial_no, email) VALUES (18, 'Z0ETQEE80W6', 'wmcconnell@brown.org');
INSERT INTO coupon (discount, serial_no, email) VALUES (34, '6OAUBOFNMM4799S88V', 'cgomez@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (52, 'XTKKXBLZZBX93GS', 'edwardsjennifer@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (85, 'OWP3D0V', 'gallagherangel@pena-russell.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (91, 'O17E3BH6NFU', 'lindsayspencer@wyatt.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (67, 'ETUSGK66QD61ZH3WOP8R', 'kimberlyreed@baldwin-scott.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (61, 'WPF946Y2FHYCJCVBZ5DS', 'ginarusso@drake-miller.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (41, 'MVO34C', 'edwardsjonathan@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (62, '77ATEV', 'kimberlyreed@baldwin-scott.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (22, 'L3IIEMC1WYM3W1KGXQ9R1', 'tchen@hernandez.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (25, 'KU21KBD7E', 'cbryant@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (20, 'DX04DLJ1O', 'hatfieldjimmy@douglas.net');
INSERT INTO coupon (discount, serial_no, email) VALUES (28, 'UXHLXFZRSKO', 'michael28@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (84, '3HHJP2PO2PP', 'yholmes@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (73, '981M45J7A6LBAE', 'james82@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (55, 'XAT20KDG7EMM7', 'slin@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (10, 'AXF6A09GKL6POJ', 'kmitchell@dorsey.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (64, '7NFADWE0UFFHJAVV', 'vancenathan@rojas.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (11, 'D3KWLC77', 'kgalvan@fisher.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (43, 'C6TPIU7QZ4W3XY9', 'james62@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (33, '6OAUBOFNMM4799S88V', 'michael54@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (71, '2C67F990PDFNMH2KND', 'michaelshort@woodward-houston.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (66, 'LGHJM2WK9TCOOI4MJEE', 'edwardsjonathan@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (69, 'BVTXD071JBIUY', 'parkstacy@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (54, 'UCVPPZOYXWYY1IQ', 'ginarusso@drake-miller.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (100, 'X9QBYBID', 'sean78@hodge.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (27, '90K8LVI', 'armstrongmatthew@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (37, 'YUJ72682YR6XBDTDSKH', 'adrianbartlett@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (5, 'EQ8GW', 'romerocaleb@crawford.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (18, 'SDWAOQL6ECL81FBZGH3Z8', 'wesleymitchell@hammond.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (39, 'JWOG2WE8', 'psmith@olson-jones.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (44, 'KFBBDJ2O', 'daniel43@nelson.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (38, 'BW30ULX2XGPUPLP', 'lindsayspencer@wyatt.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (2, 'Y2Y239JDBZL66K3', 'jennifer30@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (22, 'RRCVTYZQKRRBXM38CN1', 'znorris@hopkins.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (99, '4BQVNNGVBJ7GK5W121', 'ginarusso@drake-miller.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (2, 'Y883RPGH7U', 'mahoneyolivia@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (45, 'XMMDEQZECUBMWVS8', 'zachary98@lee.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (6, '2ITL25BIV7E2VW2THO', 'jenna75@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (87, 'GF4IPWZXNXZNUJM', 'seanthompson@schneider.net');
INSERT INTO coupon (discount, serial_no, email) VALUES (4, 'CZFJ09QE', 'alicia26@jones-farmer.net');
INSERT INTO coupon (discount, serial_no, email) VALUES (45, 'BW30ULX2XGPUPLP', 'johnsonmichael@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (85, 'ET1Q87U38A3MJ', 'vodonnell@griffin.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (99, 'C6TPIU7QZ4W3XY9', 'melissaadams@gonzalez-mcdowell.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (66, 'GGWXZ', 'armstrongmatthew@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (42, 'O8UDLDAO', 'tchen@hernandez.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (26, 'WV8XBDGHNU2CT6SY', 'dbrown@arroyo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (25, '9TD3D26HXZKO1G0HIE5', 'stevenwright@barnes-vargas.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (7, '5X84IINRW', 'johnsonmichael@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (66, 'IVT7I9WFUVYNTDK', 'bryantjeffery@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (71, 'D4PEN3PQOBHRL', 'smithtommy@brown.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (11, '5EHJW01BU2OJ9JKJWAS', 'vincenttaylor@gonzalez-austin.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (59, '90K8LVI', 'snydershaun@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (22, '6LSVLO3ERNTRZJHG0G', 'wesleymitchell@hammond.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (1, 'O8UDLDAO', 'clarkjonathan@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (63, 'UPT1C', 'sherioconnor@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (83, 'WQHR6DBMU6W3IJGNIEXF', 'joseph67@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (71, 'FNJP0CUCSX2G282D26L58', 'reesegabriel@hotmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (21, 'HUFMZDU8S', 'bethanybailey@lozano.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (54, 'MJJSR96LPHTNMZHIR8REL', 'alicia26@jones-farmer.net');
INSERT INTO coupon (discount, serial_no, email) VALUES (69, '0I8XSK1UG5C3X', 'williamssarah@hughes-hill.org');
INSERT INTO coupon (discount, serial_no, email) VALUES (20, '5K4EC6Y', 'kgalvan@fisher.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (9, '2ZYIUXLHU7ORABUN6Y', 'lindsayspencer@wyatt.biz');
INSERT INTO coupon (discount, serial_no, email) VALUES (89, 'Z00K1Q', 'xbarker@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (80, 'O8KRDW60J3K0XRHDT6XDT', 'aliciaryan@miller.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (75, 'XPCN0F1R4', 'angela19@gmail.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (66, 'WVYMG3GV', 'alicia64@moran.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (77, 'EGDFF193GSKZX', 'linda24@jones-compton.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (16, 'XTKKXBLZZBX93GS', 'dwilliams@yahoo.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (9, 'NIAUET3FH6CU', 'moyermelanie@aguilar.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (33, '2BSZUM5KAOR9G5GXMZ', 'christiangutierrez@may.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (42, 'FIIVD9380IDSKURUJ', 'knelson@frey.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (9, 'WA25GWM', 'christiangutierrez@may.com');
INSERT INTO coupon (discount, serial_no, email) VALUES (18, '6WMZLW55AV0D86', 'angela19@gmail.com');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('I0K5BF0XOU8RRWJS', 'explain');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('6V4B2UHOK5ZM1OWYE8MV', 'attorney');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('L14HL58UR82FUOI629TZJ', 'whatever');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UVVHVAESPAV8HXMX45', 'every');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('HHHDOHAVS0EO2K4RRS04', 'matter');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('YUJ72682YR6XBDTDSKH', 'character');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2CID2PM88ZLMUDAL', 'feeling');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CZFJ09QE', 'huge');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('NIAUET3FH6CU', 'provide');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MLERQAU3CZW9Y3C', 'explain');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('Z4QYNGYHM7GFKULCOI2UL', 'including');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('WPF946Y2FHYCJCVBZ5DS', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2K7X7R3APTU1FDLSP84', 'several');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3HHJP2PO2PP', 'fall');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2SW2XT1PPYX', 'suggest');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZCDOKYIXEJ7UHB0WXVT', 'data');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('QYJ6CP', 'several');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('BUE03EPCMK5CN5W86K7', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZGDI8EJIXNAIHAUG0V', 'marriage');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('QCO6X9ETFPG15BL2', 'memory');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('7YNBEF', 'bring');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('PRBQVB3CP8C', 'feeling');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('Y0D4BUL8', 'every');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ET1Q87U38A3MJ', 'light');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('6MA0OT1J2', 'which');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('V9FI47R25KVSIK', 'marriage');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('QQEYO7KC8BSL5FJ', 'choose');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('WDWIEDU09', 'reflect');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('9LNGWY5DWNPA51K2', 'learn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('HFO63EMAFK5M4V0PD5V8', 'along');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2K7X7R3APTU1FDLSP84', 'suggest');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('TZYP10H0544', 'level');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('WI6YVYO', 'power');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('VBMSWQECXWSDL7J', 'through');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('T3RTSEYP98CYC1TYM', 'debate');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('FIIVD9380IDSKURUJ', 'door');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('R0UDL5T0Q', 'turn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('Y88JFXE7I41E', 'tell');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2228EKDSEF', 'hand');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CUQUP009JQLD4ZRBZS', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('FNJP0CUCSX2G282D26L58', 'inside');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ETUSGK66QD61ZH3WOP8R', 'door');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CDQIS', 'woman');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('M95K5K9QZ', 'million');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('589SANB', 'likely');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2I43566IFBO', 'choose');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('JVDOL8R', 'result');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LYBLSUB7S10666J6VJOCJ', 'window');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('0I8XSK1UG5C3X', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZGDI8EJIXNAIHAUG0V', 'window');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('GVU0CP56W22SHL', 'responsibility');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3BVQ0WX4BBQRYZ0K3O0R', 'which');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('T5TJZ3PWAKO1O3XF', 'allow');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('V2U95QBAM', 'stock');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('N1UTCLLRD5VJWEHDWBN6', 'window');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('1XSJFSKVS6C8', 'operation');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('BKWTLRI9EO23T4J63345P', 'including');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('QYYXP', 'anything');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('A2EPH58ZDGO7J', 'data');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('57VGLO', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('WVYMG3GV', 'most');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZCDOKYIXEJ7UHB0WXVT', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MA4BF371H1LMWOCJ', 'most');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('77ATEV', 'list');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('DITF47NV9AH76', 'power');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('8JVZWM0IHY17XX', 'throughout');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('L3IIEMC1WYM3W1KGXQ9R1', 'this');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UVVHVAESPAV8HXMX45', 'whatever');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('D31Z42Z', 'whatever');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UXHLXFZRSKO', 'result');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('XLVYCBFBC03JVAQG', 'tell');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('RAONEMJLR17H5', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZGDI8EJIXNAIHAUG0V', 'learn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('QVA2UM9VYSWZ2VV', 'build');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MKO9QET3HY7P', 'learn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('PDC44U9YAF75YQQJG', 'reflect');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('77ATEV', 'explain');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('I0OJ9748', 'hand');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('U9DHEPXBH4CDB', 'explain');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('BVTXD071JBIUY', 'peace');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LFZV37F28', 'hand');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LN0AZUKE0A1TMT3GJ59', 'prepare');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('D3KWLC77', 'tell');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('7SPGQCTJ83R7DVZD', 'learn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('YXRFHRLQ', 'policy');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2ITL25BIV7E2VW2THO', 'build');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('45E2D7MV4MJN0', 'power');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZQA56', 'which');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('PLUBPMU7S9ZQ', 'baby');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('TNQ84HUOAXE', 'economy');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('62IZOU76V1EPAPZ', 'reflect');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3C0DV9JO5RS5F', 'hand');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('PLUBPMU7S9ZQ', 'visit');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('D4U6ZK8KO3U9N', 'thing');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('BUE03EPCMK5CN5W86K7', 'total');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MQC9YX5NTF169OM1', 'fall');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('N1CTQN1AEDWM04Q00', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('YTT6USN5BCYA', 'learn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('8GIVGTLBQM6Z7J2D4GEK', 'every');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UUSH3D8PB8YBW6Z', 'fall');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('53F6XOJ1JUIB', 'prepare');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2SW2XT1PPYX', 'build');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('HFO63EMAFK5M4V0PD5V8', 'attorney');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ASTLCU', 'customer');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('97QPRUTYL', 'attorney');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('RAONEMJLR17H5', 'data');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZD2CRTD', 'reflect');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5K4EC6Y', 'explain');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MVO34C', 'cold');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MT9WD29UG1D8JKZXYHBR', 'window');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('RGSP8Y', 'result');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('7ZNIARN4KATYPLOR', 'stock');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('KU21KBD7E', 'build');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('A2EPH58ZDGO7J', 'herself');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('JWOG2WE8', 'reflect');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('J5C70PD4F9807NC5', 'positive');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('X9QBYBID', 'ahead');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('U9DHEPXBH4CDB', 'most');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('02C91G77F9S3T', 'card');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LFZV37F28', 'approach');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('1S7WS7PKONTWYWX4', 'policy');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('KZ9U1E2JUS9SMJ6TQ8K', 'huge');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('92RNQOWISW5Y9', 'baby');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('8GIVGTLBQM6Z7J2D4GEK', 'data');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UEN7FUN', 'report');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('BW30ULX2XGPUPLP', 'ahead');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UYZQMXQED8H2TW', 'hand');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5A2HLJ6P', 'throughout');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('EY9BOWO0ONREKII9SYIQG', 'character');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3QM188FD73U', 'reflect');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('6D6JIDJKU2CCLYW', 'likely');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('YXRFHRLQ', 'write');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('EGDFF193GSKZX', 'memory');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('A9ACTJAH3F', 'operation');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('O8KRDW60J3K0XRHDT6XDT', 'suggest');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UPT1C', 'along');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CJ8GR5XGB9XNXCW4LKME', 'total');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('92RNQOWISW5Y9', 'several');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('6Q3GO4LPZG2E8LZQ7DUXY', 'through');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('L14HL58UR82FUOI629TZJ', 'visit');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('QIO1AG64EYG02PKZEF6', 'character');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3OPK3DH4ZI73RO', 'huge');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3TGKD7HO9EKV69R0UIP', 'herself');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZGDI8EJIXNAIHAUG0V', 'inside');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('HK06V2AR', 'thing');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('VF3A3D', 'inside');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('7FN4G7FYOI18A2AQVD', 'which');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('M70ZQD6N2FJQ1OJA', 'election');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('RI5SPSRSS1R29UB', 'several');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('97N27TIYC', 'character');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('04GWNLKR', 'write');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5FKZ5E1M87QESJ30Q', 'reflect');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ASTLCU', 'thing');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('JVDOL8R', 'peace');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('90K8LVI', 'thing');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('30OR6SWDE690', 'million');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2C67F990PDFNMH2KND', 'million');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('1XSJFSKVS6C8', 'might');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('KU21KBD7E', 'ahead');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5PQJ744', 'including');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CWO0WGF5R', 'might');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CWO0WGF5R', 'tree');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5A2HLJ6P', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('Y2Y239JDBZL66K3', 'increase');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('949BZO', 'must');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('EY9BOWO0ONREKII9SYIQG', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('FZ56D1Q7Q', 'card');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2ITL25BIV7E2VW2THO', 'learn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('FCU04Y3TF63OILE5RSL3', 'data');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('Y2Y239JDBZL66K3', 'turn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5PQJ744', 'election');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('IHKERZ4HCFSBT', 'throughout');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CXWEZJ', 'every');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('EQ8GW', 'hand');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('SANR15W261T', 'light');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('7L9KY', 'election');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3BVQ0WX4BBQRYZ0K3O0R', 'responsibility');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('N02AJ1BU62TVQAV', 'whatever');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UPT1C', 'prepare');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ERZG9X', 'election');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MUJZQQ', 'approach');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('AJ7OC2KWG', 'light');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2SW2XT1PPYX', 'learn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('F0U1TA', 'through');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('0I8XSK1UG5C3X', 'learn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('AGCYAE21BNK19H', 'tell');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ZQA56', 'laugh');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5PQJ744', 'several');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('22K2FGBX3B7MGM3D4U', 'provide');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('M70ZQD6N2FJQ1OJA', 'stock');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2IS59RXMJQH6K', 'customer');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('99QTL5HHJXO8BAPA55VO', 'huge');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('R0UDL5T0Q', 'allow');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('30OR6SWDE690', 'visit');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('9DGZDOJSMHYA', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CZFJ09QE', 'tell');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('PRBQVB3CP8C', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CBMBFZFMGFQQ', 'raise');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('S1K5SO8KVT5DEA1', 'feeling');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('R7BSNEKS4IGM4OVIEXLK', 'anything');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3XFYKT1MPFV4KS9AT900', 'write');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5X84IINRW', 'choose');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('W7SM1', 'party');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('Y5X3BG429E28TN', 'choose');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('RI5SPSRSS1R29UB', 'tell');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('Y0D4BUL8', 'several');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('N1UTCLLRD5VJWEHDWBN6', 'which');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('27MCUEOD4FUNSK', 'explain');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('699OPJEQ5B20HL07', 'marriage');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('IVT7I9WFUVYNTDK', 'office');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('BH5BATRJWJY', 'anything');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('XLVYCBFBC03JVAQG', 'class');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('H8JDI', 'lose');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('XMMDEQZECUBMWVS8', 'operation');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('JWOG2WE8', 'total');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('H8JDI', 'card');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('PLUBPMU7S9ZQ', 'office');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('NB24TDA92', 'strategy');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('HFO63EMAFK5M4V0PD5V8', 'reflect');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3BVQ0WX4BBQRYZ0K3O0R', 'inside');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('SANR15W261T', 'might');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('OOCLVBBZCZIG', 'election');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('27MCUEOD4FUNSK', 'environment');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('F56V57VNWTG0PEW', 'thing');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('M70ZQD6N2FJQ1OJA', 'thing');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('S1K5SO8KVT5DEA1', 'matter');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('1S7WS7PKONTWYWX4', 'hand');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UQ0M7JMGK', 'several');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2I43566IFBO', 'marriage');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('VF3A3D', 'this');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('D4U6ZK8KO3U9N', 'provide');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('92RNQOWISW5Y9', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('DLTZVZJ', 'coach');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2IS59RXMJQH6K', 'cold');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LYBLSUB7S10666J6VJOCJ', 'allow');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('GF4IPWZXNXZNUJM', 'among');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('RRCVTYZQKRRBXM38CN1', 'might');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('L8R0R2CPTTN2Z0SQ55BV', 'through');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2CID2PM88ZLMUDAL', 'attorney');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('D4PEN3PQOBHRL', 'herself');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('WSZK32VL95', 'might');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('GFN4N4GWD', 'whatever');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LYBLSUB7S10666J6VJOCJ', 'responsibility');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5QQQHCZ', 'fall');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('F0U1TA', 'peace');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('Z5OJ6ZTHT1O76CHLG9', 'positive');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('WPF946Y2FHYCJCVBZ5DS', 'huge');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('O0AJGLWV5YIJSHGE3', 'laugh');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('9TD3D26HXZKO1G0HIE5', 'this');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('EHMPBT02NO4LGPA', 'card');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LU89A', 'write');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('2I43566IFBO', 'turn');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('9GSJMDS78HQN', 'must');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('H8JDI', 'strategy');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('30OR6SWDE690', 'approach');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('B5B2RB', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MJJSR96LPHTNMZHIR8REL', 'election');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('XHYK1', 'positive');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('MJJSR96LPHTNMZHIR8REL', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LU89A', 'debate');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('97QPRUTYL', 'visit');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('ILQNSNAUOE8', 'raise');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('KZ9U1E2JUS9SMJ6TQ8K', 'million');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LFZV37F28', 'along');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('21UGUUBNP1', 'result');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('B732DEO', 'along');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('UFILA9KZ2QEMYG76', 'feeling');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3OT4U0OZFD95E9K', 'every');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5X84IINRW', 'office');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('13URU71I0ET52TX', 'total');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('HHHDOHAVS0EO2K4RRS04', 'laugh');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LHK0T9S', 'light');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3EERUKR5EZZUJRL6', 'party');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('C6TPIU7QZ4W3XY9', 'fall');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('GU6848TQ4VA5R', 'matter');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('APVBWS1XK7E', 'explain');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('GF4IPWZXNXZNUJM', 'character');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('V9FI47R25KVSIK', 'build');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('RI5SPSRSS1R29UB', 'attorney');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('M70ZQD6N2FJQ1OJA', 'which');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('RRCVTYZQKRRBXM38CN1', 'tell');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('45E2D7MV4MJN0', 'bring');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('VPKLW00GUMQ89S7QV', 'probably');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('DTJ3FON8UE3D95N4INSF', 'fall');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('5X84IINRW', 'whatever');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('WE1Q5UY', 'bring');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('1XSJFSKVS6C8', 'every');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3OPK3DH4ZI73RO', 'report');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('M95K5K9QZ', 'policy');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('LYBLSUB7S10666J6VJOCJ', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('OOCLVBBZCZIG', 'apply');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('VBMSWQECXWSDL7J', 'most');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('30OR6SWDE690', 'huge');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('TS0AU', 'inside');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('CNB4GX0R2UPU', 'total');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('3OT4U0OZFD95E9K', 'tree');
INSERT INTO item_keyword (serial_no, keyword) VALUES ('8HBG25ODWXJT9ECAHI', 'peace');
CREATE VIEW avg_item_rating AS
        SELECT
            item.serial_no,
            AVG(item_review.rating) as avg_rating
        FROM item, item_review
        WHERE item.serial_no = item_review.serial_no
        GROUP BY item.serial_no;
CREATE VIEW order_price AS
        SELECT
            order_contents.order_id,
            SUM(item.price * order_contents.quantity) as total_price
        FROM item, order_contents
        WHERE item.serial_no = order_contents.serial_no
        GROUP BY order_contents.order_id
COMMIT
