-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!

CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "email" VARCHAR (150) UNIQUE NOT NULL,
    "first_name" VARCHAR (100) NOT NULL,
    "last_name" VARCHAR (100) NOT NULL,
    "password" VARCHAR (1000) NOT NULL,
    "access_level" INT
);

CREATE TABLE "demographic" (
    "id" SERIAL PRIMARY KEY,
    "age" VARCHAR (150),
    "ethnicity" VARCHAR (50),
    "gender" VARCHAR (50),
    "sexual_orientation" VARCHAR (50),
    "ability" VARCHAR (50),
    "income" VARCHAR (50),
    "education" VARCHAR (50),
    "user_id" int REFERENCES "users" 
);
CREATE TABLE "category" (
    "id" SERIAL PRIMARY KEY,
 	"name" VARCHAR (100)
);
CREATE TABLE "skills" (
    "id" SERIAL PRIMARY KEY,
    "skill" VARCHAR (150),
    "category_id" int REFERENCES "category" 
);
CREATE TABLE "users_skills" (
    "id" SERIAL PRIMARY KEY,
    "user_id" int REFERENCES "users",
    "skill_id" int REFERENCES "skills" 
);
CREATE TABLE "social_media" (
    "id" SERIAL PRIMARY KEY,
    "twitter" VARCHAR (150),
    "facebook" VARCHAR (150),
    "linkedin" VARCHAR (150),
    "instagram" VARCHAR (150),
    "user_id" int REFERENCES "users" 
);
CREATE TABLE "about" (
    "id" SERIAL PRIMARY KEY,
    "display_name" VARCHAR (100),
    "community_role" VARCHAR (150),
    "organization_name" VARCHAR (100),
    "mentor" boolean,
    "mentee" boolean,
    "job_title" VARCHAR (100),
    "address" VARCHAR (150),
    "city" VARCHAR (100),
    "state" VARCHAR (100),
    "zip_code" int,
    "linkedin" VARCHAR (150),
    "facebook" VARCHAR (150),
    "twitter" VARCHAR (150),
    "instagram" VARCHAR (150),
    "headshot" VARCHAR (200),
    "bio" VARCHAR (300),
    "tshirt_size" VARCHAR (50),
    "birthday" DATE,
    "user_id" int REFERENCES "users" 
);

CREATE TABLE "favorites" (
    "id" SERIAL PRIMARY KEY,
    "user_id" int REFERENCES "users",
    "favorite_id" VARCHAR (128),
    "favorite_type" VARCHAR (16)
);

CREATE TABLE "chat_instance" (
"id" SERIAL PRIMARY KEY,
"user_1" INT REFERENCES "users",
"user_2" INT REFERENCES "users"
);

CREATE TABLE "messages" (
"id" SERIAL PRIMARY KEY,
"chat_id" INT REFERENCES "chat_instance",
"user" INT REFERENCES "users",
"message" VARCHAR(256)
);

CREATE TABLE "member" (
    "id" SERIAL PRIMARY KEY,
    "user_id" int REFERENCES "users",
    "member_level" int 
);

CREATE TABLE "personality" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INT REFERENCES "users",
    "myers_briggs" VARCHAR(25),
     "disc" VARCHAR(25),
     "agility_index" VARCHAR (25),
      "enneagram" VARCHAR(25)
);

CREATE TABLE "industry" (
    "id" SERIAL PRIMARY KEY,
 	"name" VARCHAR (100)
);

CREATE TABLE "careerLevel" (
    "id" SERIAL PRIMARY KEY,
 	"name" VARCHAR (100)
);

CREATE TABLE "userIndustry" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INT REFERENCES "users",
 	"selected" INT REFERENCES "industry"
);

CREATE TABLE "userCareerLevel" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INT REFERENCES "users",
 	"selected" INT REFERENCES "careerLevel");
 	
-- starter categories
INSERT INTO "category" ("name")
VALUES 
('Leadership'),
('Business and Entreprenuership'),
('Marketing and Sales'),
('Techical Skills'),
('Accounting and Finance'),
('Legal'),
('Health and Wellness'),
('Human Resources'),
('Education'),
('Artists and Creatives'),
('Community Advocacy'),
('Civic Engagement');



INSERT INTO "skills" ("skill", "category_id") VALUES
('Active listening','1'),
('Adaptability','1'),
('Advising','1'),
('Analytical thinking','1'),
('Business knowledge','1'),
('Caring','1'),
('Coaching','1'),
('Collaboration','1'),
('Communication','1'),
('Conceptual thinking','1'),
('Cooperation','1'),
('Creativity','1'),
('Critical thinking','1'),
('Curiosity','1'),
('Decision making','1'),
('Delegation','1'),
('Diplomacy','1'),
('Emotional intelligence','1'),
('Executive presence','1'),
('Flexibility','1'),
('Initiative','1'),
('Innovation','1'),
('Integrity','1'),
('Motivation','1'),
('Negotiating','1'),
('Networking','1'),
('Patience','1'),
('Perseverance','1'),
('Planning','1'),
('Presenting','1'),
('Problem solving','1'),
('Productivity','1'),
('Respect','1'),
('Responsibility','1'),
('Sense of humor','1'),
('Sharing','1'),
('Strategic thinking','1'),
('Troubleshooting','1'),
('AgTech','2'),
('Allergen-friendly foods','2'),
('Attention to detail','2'),
('Brick and mortar business','2'),
('Business ethics','2'),
('Business intelligence','2'),
('Business models','2'),
('Business plans','2'),
('Catering','2'),
('Culinary business','2'),
('E-tail','2'),
('Entrepreneurial mindset','2'),
('Environmental business','2'),
('Filing and paper management','2'),
('FoodTech','2'),
('Global entrepreneurship','2'),
('Goal setting','2'),
('Idea validation','2'),
('Intrapreneurship','2'),
('Inventors','2'),
('Lean canvas','2'),
('Main St. business','2'),
('Maker and artisan business','2'),
('Manufacturing','2'),
('Market deployment','2'),
('Market research','2'),
('Mergers and acquisitions','2'),
('Metric and KPI tracking','2'),
('Microbusiness','2'),
('Multi-tasking','2'),
('Nonprofits','2'),
('Office management','2'),
('Performance analysis','2'),
('Pitch decks','2'),
('Pitching','2'),
('PMP Certification','2'),
('Prioritizing','2'),
('Product launch','2'),
('Product research','2'),
('Product validation','2'),
('Project management','2'),
('Property management','2'),
('Real estate','2'),
('Renewable energy','2'),
('Resource management','2'),
('Restaurants','2'),
('Retail business','2'),
('Risk analysis','2'),
('Risk management','2'),
('Scaling strategy','2'),
('Scheduling','2'),
('Social enterprise','2'),
('Startup culture','2'),
('Strategic partnerships','2'),
('Strategic planning','2'),
('Supply chain and logistics','2'),
('Sustainability','2'),
('Time management','2'),
('Venture capital raises','2'),
('Warehousing','2'),
('B2B marketing','3'),
('B2C marketing','3'),
('Blogging','3'),
('Brand management','3'),
('Business development','3'),
('Buyer engagement','3'),
('Buyer-responsive selling','3'),
('Campaign management','3'),
('Click funnels','3'),
('Closing','3'),
('CMS tools','3'),
('Cold calling','3'),
('Consumer behaviors','3'),
('Content creation','3'),
('Content marketing','3'),
('Copywriting','3'),
('CRO and A/B testing','3'),
('Customer relationship management (CRM)','3'),
('Data analysis','3'),
('Data visualization and pattern-finding','3'),
('Email marketing','3'),
('Event management','3'),
('Event planning','3'),
('Experiential marketing','3'),
('Facebook ads','3'),
('Facebook marketing','3'),
('Google AdWords','3'),
('Heat mapping','3'),
('Influencer marketing','3'),
('Instagram marketing','3'),
('Lead generation','3'),
('LinkedIn marketing','3'),
('Marketing automation','3'),
('Media buying/planning','3'),
('Media relations','3'),
('Mobile marketing','3'),
('Paid social ads','3'),
('Persuasion','3'),
('Podcasting','3'),
('PPC','3'),
('Press releases','3'),
('Product knowledge','3'),
('Proposal writing','3'),
('Public relations','3'),
('Public speaking','3'),
('Reputation management','3'),
('SEO/SEM','3'),
('Snapchat marketing','3'),
('Social media marketing','3'),
('Storytelling','3'),
('TikTok marketing','3'),
('Twitter marketing','3'),
('Web analytics','3'),
('Web scraping','3'),
('Wordpress','3'),
('YouTube marketing','3'),
('Adobe Flash','4'),
('Adobe Illustrator','4'),
('Adobe InDesign','4'),
('Adobe Photoshop','4'),
('Agile Business Analysis','4'),
('Application Programming Interface (API)','4'),
('Artificial intelligence','4'),
('Big Data tools','4'),
('Business process modeling','4'),
('C+','4'),
('Cloud networking','4'),
('Color sense and theory','4'),
('Content Management Systems (CMS)','4'),
('CSS preprocessors','4'),
('Data analysis','4'),
('Data Mapping','4'),
('Digital printing','4'),
('Dreamweaver','4'),
('Entity Relationship Diagrams','4'),
('File sharing','4'),
('Git/Version control (Github\, gitlab)','4'),
('Gmail','4'),
('Go','4'),
('Google Docs','4'),
('Google Forms','4'),
('Google Sheets','4'),
('Google Slides','4'),
('Graphic design','4'),
('Graphic User Interfaces (GUI)','4'),
('HTML and CSS','4'),
('Infographics','4'),
('InfoSec','4'),
('Interactive media design','4'),
('IoT','4'),
('IT Networks','4'),
('JavaScript','4'),
('Logo creation','4'),
('Machine learning','4'),
('Matlab','4'),
('Microsoft Access','4'),
('Microsoft Excel','4'),
('Microsoft Outlook','4'),
('Microsoft Powerpoint','4'),
('Microsoft Publisher','4'),
('Microsoft Visio','4'),
('Photo editing','4'),
('Photography','4'),
('Python','4'),
('R','4'),
('Research and data analysis','4'),
('Responsive design principles','4'),
('Robotics','4'),
('Ruby','4'),
('SaaS','4'),
('Scala','4'),
('Six Sigma','4'),
('Storyboarding','4'),
('Swift','4'),
('System Context Diagrams','4'),
('Technical writing','4'),
('Testing/Debugging','4'),
('Typography','4'),
('UI/UX','4'),
('UNIX','4'),
('Video editing','4'),
('Videography','4'),
('Visual Basic','4'),
('Waterfall','4'),
('Wireframes','4'),
('Wordpress','4'),
('C++ ','4'),
('C#','4'),
('React','4'),
('Redux','4'),
('AngularJS (1.x)','4'),
('Angular (2+)','4'),
('TypeScript','4'),
('jQuery','4'),
('PHP','4'),
('.NET','4'),
('Docker','4'),
('Kubernetes','4'),
('AWS (Amazon Web Services)','4'),
('Azure','4'),
('GCP (Google Cloud Platform)','4'),
('Heroku','4'),
('REST','4'),
('SOAP','4'),
('Socket Protocols','4'),
('Scoping','4'),
('Symfony','4'),
('Laravel','4'),
('Cloud Native Development','4'),
('Microservices','4'),
('Adobe After Effects','4'),
('Adobe Premier','4'),
('Motion Graphics','4'),
('Unity','4'),
('Unreal','4'),
('Virtual Reality Development','4'),
('Augmented Reality Development','4'),
('Mixed Reality Development','4'),
('Autodesk 3DS Max','4'),
('Autodesk Maya','4'),
('CAD','4'),
('Firebase','4'),
('RxJS','4'),
('NgRx','4'),
('Java / Spring','4'),
('Java / Kotlin','4'),
('Mocha','4'),
('Chai','4'),
('Sinon','4'),
('Selenium','4'),
('Serverless','4'),
('Pandas','4'),
('OpenCV','4'),
('TensorFlow','4'),
('Cybersecurity','4'),
('Functional Programming','4'),
('Object Orientated Programming','4'),
('Design Patterns','4'),
('Bootstrap','4'),
('Material UI','4'),
('Less','4'),
('Sass','4'),
('Bulma','4'),
('Skeleton (CSS)','4'),
('Semantic UI','4'),
('Three.js','4'),
('Substance designer','4'),
('401(k) investments','5'),
('Alternative capital','5'),
('Annual budgets','5'),
('Asset management','5'),
('Auditing','5'),
('Banking','5'),
('Blockchain','5'),
('Budget planning','5'),
('Budgeting','5'),
('Cryptocurrency','5'),
('Development strategies','5'),
('Donor relations','5'),
('Drake','5'),
('Economics - macro','5'),
('Economics - micro','5'),
('Enterprise resource planning','5'),
('Financial planning','5'),
('Financial reporting','5'),
('Fiscal governance','5'),
('Fundraising','5'),
('GAAP','5'),
('International finance','5'),
('Investment planning','5'),
('Lacerte','5'),
('Mint','5'),
('Money handling','5'),
('Private equity','5'),
('ProConnect','5'),
('QuickBooks','5'),
('Quicken','5'),
('Reporting analysis','5'),
('Revenue modeling','5'),
('Revenue recognition','5'),
('Seed funding','5'),
('Series A funding','5'),
('Series B funding','5'),
('Series C funding','5'),
('Stocks and annuities','5'),
('Tax filing - business','5'),
('Tax filing - personal','5'),
('Tax planning','5'),
('TurboTax','5'),
('Venture capital funding','5'),
('Xero','5'),
('Bankruptcy','6'),
('Business entity setup up','6'),
('Business filing','6'),
('Business law','6'),
('Business structure','6'),
('Constitutional law','6'),
('Contracts','6'),
('Criminal law','6'),
('Disability law','6'),
('Employment law','6'),
('Environmental law','6'),
('Family law','6'),
('Housing discrimination','6'),
('Intellectual property','6'),
('Legal research','6'),
('Mediation','6'),
('Negotiation','6'),
('Nonprofit governance','6'),
('Notary public','6'),
('Paralegal','6'),
('Patents','6'),
('Privacy','6'),
('Real estate','6'),
('Tax law','6'),
('Trial advocacy','6'),
('Trusts and estates','6'),
('Acupuncture','7'),
('Acute care','7'),
('Addiction/intervention counseling','7'),
('Aesthetics','7'),
('Attention to detail','7'),
('Barre','7'),
('Basketball','7'),
('Beauty products','7'),
('Boxing','7'),
('Chiropractic care','7'),
('Coping strategies','7'),
('Counseling','7'),
('CPR','7'),
('Dance','7'),
('Depression and anxiety care','7'),
('Family counseling','7'),
('Gender therapy','7'),
('Hair products','7'),
('Hairstyling','7'),
('Homeopathy','7'),
('Infection control','7'),
('Kickball','7'),
('Manicures and pedicures','7'),
('Marriage counseling','7'),
('Massage therapy','7'),
('Medical coding and billing','7'),
('Medical practice - general','7'),
('Medical practice - specialized','7'),
('Natural hair','7'),
('Natural wellness','7'),
('Naturopathy','7'),
('Neurolinguistic programming','7'),
('Occupational therapy','7'),
('Patient care and assistance','7'),
('Peloton','7'),
('Physical fitness','7'),
('Physical therapy','7'),
('Physical training','7'),
('Pilates','7'),
('Psychiatric care','7'),
('Reiki','7'),
('Relationship counseling','7'),
('Running - casual','7'),
('Running - distance','7'),
('Salons','7'),
('Sex therapy','7'),
('Soccer','7'),
('Softball/baseball','7'),
('Spas','7'),
('Spinning','7'),
('Stress management','7'),
('Telemetry','7'),
('WERQ Dance Fitness','7'),
('Yoga','7'),
('Youth counseling','7'),
('Zumba','7'),
('ADP','8'),
('Benefits administration','8'),
('Conflict management','8'),
('Conflict resolution','8'),
('Culture building','8'),
('Diversity and inclusion','8'),
('EAP','8'),
('EEOC','8'),
('Employee coaching','8'),
('Employee engagement','8'),
('Employee handbooks','8'),
('Employee leave policies','8'),
('Employee mentorship programs','8'),
('Employee policies','8'),
('Employee recognition','8'),
('Employment equity','8'),
('Gusto','8'),
('Hiring best practices','8'),
('Hiring pipeline','8'),
('HRIS','8'),
('HSA accounts','8'),
('Industrial psychology','8'),
('Intercultural sensitivity','8'),
('Interview skills','8'),
('Interviewing','8'),
('IT recruiting','8'),
('Life insurance','8'),
('Maternity leave policies','8'),
('Medical/dental/vision insurance','8'),
('Organizational psychology','8'),
('OSHA','8'),
('Pay equity','8'),
('Payroll','8'),
('People management','8'),
('Professional development','8'),
('PTO','8'),
('Recruiting','8'),
('Resumes','8'),
('Safe work practices','8'),
('Strong work culture','8'),
('Team policies','8'),
('Teambuilding','8'),
('Workforce development','8'),
('Active learning','9'),
('Adult learning','9'),
('Anti-bullying strategies','9'),
('Anti-racist education','9'),
('Arts education','9'),
('Curriculum design','9'),
('Design thinking','9'),
('Digital divide - education','9'),
('Digital literacy','9'),
('Disciplinary strategies','9'),
('E-learning','9'),
('EdTech','9'),
('Education administration','9'),
('Educational representation','9'),
('Equity in education','9'),
('Experiential learning','9'),
('Front-end design','9'),
('Gamification','9'),
('Higher ed instruction','9'),
('Instructional design','9'),
('K-12 instruction','9'),
('Language instruction','9'),
('LMS platforms','9'),
('Math education','9'),
('Pedagogy','9'),
('Physical education','9'),
('Pre-K instruction','9'),
('Professional development','9'),
('Project-based learning','9'),
('School of the future','9'),
('Science education','9'),
('Social science education','9'),
('STEM instruction','9'),
('Student support','9'),
('Team-based learning','9'),
('Youth engagement','9'),
('3D printing','10'),
('Abstract art','10'),
('Animation','10'),
('Apparel','10'),
('Architecture','10'),
('Artisanal products','10'),
('Asemic writing','10'),
('Blues','10'),
('Calligraphy','10'),
('Candle making','10'),
('Cartoon','10'),
('Ceramics','10'),
('Collage','10'),
('Comics','10'),
('Computer art','10'),
('Concept art','10'),
('Country','10'),
('Cubism','10'),
('Dance','10'),
('Dance','10'),
('Decollage','10'),
('Decorative art','10'),
('Drawing','10'),
('Dubstep','10'),
('EDM','10'),
('Emo','10'),
('Etching','10'),
('Expressionism','10'),
('Fabrication','10'),
('Fashion design','10'),
('Film','10'),
('Found object art','10'),
('Garden design','10'),
('Glass blowing','10'),
('Global art','10'),
('Gospel','10'),
('Graffiti','10'),
('Graphic design','10'),
('Handmade cosmetics','10'),
('Hip-hop','10'),
('Illustration','10'),
('Impressionism','10'),
('Indie','10'),
('Installation art','10'),
('Internet art','10'),
('Jazz','10'),
('Jewellry making','10'),
('Land art','10'),
('Leather working','10'),
('Lithography','10'),
('Mail art','10'),
('Maker movement','10'),
('Metal working','10'),
('Mixed media','10'),
('Motion graphic design','10'),
('Music','10'),
('Opera','10'),
('Orchestra','10'),
('Painting','10'),
('Photography','10'),
('Poetry','10'),
('Pop/Top 40','10'),
('Printmaking','10'),
('Punk','10'),
('R&B','10'),
('Reggae','10'),
('Rock balancing','10'),
('Screenprinting','10'),
('Sculpture','10'),
('Ska','10'),
('Sketching','10'),
('Social sculpture','10'),
('Soul','10'),
('Street art','10'),
('Surrealism','10'),
('Techno','10'),
('Typography','10'),
('Video art','10'),
('Woodworking','10'),
('Disability advocacy','11'),
('Gun control','11'),
('Internet privacy','11'),
('LGBTQIA issues','11'),
('Nature conservancy','11'),
('Pay equity','11'),
('Prochoice','11'),
('Prolife','11'),
('Public health','11'),
('Racial equity','11'),
('Systemic oppression','11'),
('Women''s equity','11'),
('Women''s issues','11'),
('Youth issues','11'),
('Food insecurity ','11'),
('Affordable housing','12'),
('Animal welfare','12'),
('Infrastructure','12'),
('Local control','12'),
('Public policy','12'),
('Transportation','12'),
('Voting rights','12');


