import 'package:flutter/material.dart';

class QuestionDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question Title:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Sample Question Title',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Question Body:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/200/300',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Question Tags:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                children: [
                  Chip(
                    label: Text('sample-tag-1'),
                  ),
                  Chip(
                    label: Text('sample-tag-2'),
                  ),
                  Chip(
                    label: Text('sample-tag-3'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Question Owner:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/200',
                  ),
                ),
                title: Text('Sample User'),
                subtitle: Text('sampleuser@example.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  // "items": [


















  //   {
  //     "tags": [
  //       "json",
  //       "jolt"
  //     ],
  //     "owner": {
  //       "account_id": 12728027,
  //       "reputation": 21,
  //       "user_id": 9245804,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/1e391f65a7e84c58ed42f6c54d688851?s=256&d=identicon&r=PG&f=1",
  //       "display_name": "Rock",
  //       "link": "https://stackoverflow.com/users/9245804/rock"
  //     },
  //     "is_answered": false,
  //     "view_count": 27,
  //     "answer_count": 2,
  //     "score": 2,
  //     "last_activity_date": 1681021211,
  //     "creation_date": 1680970774,
  //     "last_edit_date": 1680974026,
  //     "question_id": 75966364,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75966364/add-a-property-to-nested-array-objects-by-locating-the-parent-array-object",
  //     "title": "Add a property to nested array objects by locating the parent array object"
  //   },



















  //   {
  //     "tags": [
  //       "hardware",
  //       "bios",
  //       "cpu-speed"
  //     ],
  //     "owner": {
  //       "account_id": 6685760,
  //       "reputation": 211,
  //       "user_id": 5157081,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/49a6a49fef1187070a00a5570dba0fa3?s=256&d=identicon&r=PG&f=1",
  //       "display_name": "Moiz Travadi",
  //       "link": "https://stackoverflow.com/users/5157081/moiz-travadi"
  //     },
  //     "is_answered": false,
  //     "view_count": 2,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021208,
  //     "creation_date": 1681021208,
  //     "question_id": 75969063,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969063/how-to-unlock-cpu-speed-on-windows-10-macbook-pro-retina-13-with-dead-battery",
  //     "title": "How to unlock CPU speed on Windows 10 MacBook Pro Retina 13 with dead battery?"
  //   },
  //   {
  //     "tags": [
  //       "kotlin",
  //       "android-fragments"
  //     ],
  //     "owner": {
  //       "account_id": 28254633,
  //       "reputation": 1,
  //       "user_id": 21600281,
  //       "user_type": "registered",
  //       "profile_image": "https://lh3.googleusercontent.com/a/AGNmyxbt-I1NtcDdXMGC6_hwoGJG5_X7Wn2s2oJ9xFJbFQ=k-s256",
  //       "display_name": "luke clark",
  //       "link": "https://stackoverflow.com/users/21600281/luke-clark"
  //     },
  //     "is_answered": false,
  //     "view_count": 2,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021205,
  //     "creation_date": 1681021184,
  //     "last_edit_date": 1681021205,
  //     "question_id": 75969062,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969062/android-fragments-how-to-prevent-app-from-suspending-when-popping-the-only-fra",
  //     "title": "(Android Fragments) How to prevent app from suspending when popping the only fragment on stack?"
  //   },
  //   {
  //     "tags": [
  //       "python",
  //       "python-3.x",
  //       "google-oauth",
  //       "google-colaboratory",
  //       "google-auth-library"
  //     ],
  //     "owner": {
  //       "account_id": 28200319,
  //       "reputation": 1,
  //       "user_id": 21554203,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/d18fc4b1fb4508c3fdb6287261d8606d?s=256&d=identicon&r=PG&f=y&so-version=2",
  //       "display_name": "mitisani lisinani",
  //       "link": "https://stackoverflow.com/users/21554203/mitisani-lisinani"
  //     },
  //     "is_answered": false,
  //     "view_count": 3,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021172,
  //     "creation_date": 1681021172,
  //     "question_id": 75969061,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969061/how-to-upgrade-google-auth-oauthlib-library-in-google-colab",
  //     "title": "How to upgrade google-auth-oauthlib library in google colab?"
  //   },
  //   {
  //     "tags": [
  //       "javascript",
  //       "python",
  //       "redirect",
  //       "fetch",
  //       "fastapi"
  //     ],
  //     "owner": {
  //       "account_id": 18327828,
  //       "reputation": 33,
  //       "user_id": 14494940,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/f3dd72f92b7871a7ee630cb8fe71bf60?s=256&d=identicon&r=PG&f=1",
  //       "display_name": "alvaroquin",
  //       "link": "https://stackoverflow.com/users/14494940/alvaroquin"
  //     },
  //     "is_answered": true,
  //     "view_count": 515,
  //     "accepted_answer_id": 75188418,
  //     "answer_count": 1,
  //     "score": 2,
  //     "last_activity_date": 1681021168,
  //     "creation_date": 1674220029,
  //     "last_edit_date": 1678008930,
  //     "question_id": 75184430,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75184430/how-to-redirect-the-user-to-another-page-after-login-using-javascript-fetch-api",
  //     "title": "How to redirect the user to another page after login using JavaScript Fetch API?"
  //   },
  //   {
  //     "tags": [
  //       "c"
  //     ],
  //     "owner": {
  //       "account_id": 23257931,
  //       "reputation": 11,
  //       "user_id": 20384189,
  //       "user_type": "registered",
  //       "profile_image": "https://lh3.googleusercontent.com/a/ALm5wu0HI6CkdU0zhllLxNC9kLvbl0ycOYIgyYPqKDy2JA=k-s256",
  //       "display_name": "dom ",
  //       "link": "https://stackoverflow.com/users/20384189/dom"
  //     },
  //     "is_answered": false,
  //     "view_count": 9,
  //     "answer_count": 0,
  //     "score": -1,
  //     "last_activity_date": 1681021165,
  //     "creation_date": 1681020950,
  //     "last_edit_date": 1681021165,
  //     "question_id": 75969045,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969045/how-do-i-do-a-process-timer-interrupt",
  //     "title": "How do I do a process timer Interrupt?"
  //   },
  //   {
  //     "tags": [
  //       "sql",
  //       "json",
  //       "python-3.x",
  //       "server",
  //       "open-json"
  //     ],
  //     "owner": {
  //       "account_id": 17504787,
  //       "reputation": 51,
  //       "user_id": 12694274,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/eac482578404a81a40fc7ce246296a08?s=256&d=identicon&r=PG&f=1",
  //       "display_name": "Keshav",
  //       "link": "https://stackoverflow.com/users/12694274/keshav"
  //     },
  //     "is_answered": false,
  //     "view_count": 3,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021161,
  //     "creation_date": 1681021161,
  //     "question_id": 75969060,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969060/how-to-pass-entire-json-from-api-to-sql-server-and-then-insert-the-data-in-one-s",
  //     "title": "How to pass entire JSON from api to SQL Server and then INSERT the data in one statement with OPENJSON using python"
  //   },
  //   {
  //     "tags": [
  //       "c"
  //     ],
  //     "owner": {
  //       "account_id": 26418707,
  //       "reputation": 5,
  //       "user_id": 20066675,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/04b617a1d442b8acce1ae7da05ae10b1?s=256&d=identicon&r=PG&f=1",
  //       "display_name": "Deujsx",
  //       "link": "https://stackoverflow.com/users/20066675/deujsx"
  //     },
  //     "is_answered": false,
  //     "view_count": 5,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021145,
  //     "creation_date": 1681021145,
  //     "question_id": 75969059,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969059/c-assignment-loops-and-arrays",
  //     "title": "C assignment Loops and Arrays"
  //   },
  //   {
  //     "tags": [
  //       "gradle",
  //       "properties",
  //       "task"
  //     ],
  //     "owner": {
  //       "account_id": 4904476,
  //       "reputation": 4278,
  //       "user_id": 3951576,
  //       "user_type": "registered",
  //       "accept_rate": 50,
  //       "profile_image": "https://www.gravatar.com/avatar/8490e309df59a115f457328b10e6fd68?s=256&d=identicon&r=PG&f=1",
  //       "display_name": "eastwater",
  //       "link": "https://stackoverflow.com/users/3951576/eastwater"
  //     },
  //     "is_answered": false,
  //     "view_count": 3,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021141,
  //     "creation_date": 1681021141,
  //     "question_id": 75969058,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969058/gradle-how-to-combine-two-tasks-with-without-a-property-value-set",
  //     "title": "gradle: how to combine two tasks with/without a property value set?"
  //   },
  //   {
  //     "tags": [
  //       "python",
  //       "django",
  //       "django-models",
  //       "django-views"
  //     ],
  //     "owner": {
  //       "account_id": 28254379,
  //       "reputation": 1,
  //       "user_id": 21600060,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/5ac449cd25877cb2f805ebac6a69e3f1?s=256&d=identicon&r=PG&f=y&so-version=2",
  //       "display_name": "reck21",
  //       "link": "https://stackoverflow.com/users/21600060/reck21"
  //     },
  //     "is_answered": false,
  //     "view_count": 16,
  //     "answer_count": 2,
  //     "score": 0,
  //     "last_activity_date": 1681021131,
  //     "creation_date": 1681018596,
  //     "question_id": 75968944,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75968944/how-to-let-the-users-download-json-csv-file-in-django",
  //     "title": "How to let the users download JSON &amp; CSV File in django?"
  //   },
  //   {
  //     "tags": [
  //       "python",
  //       "pandas",
  //       "dataframe"
  //     ],
  //     "owner": {
  //       "account_id": 11654714,
  //       "reputation": 45,
  //       "user_id": 8534835,
  //       "user_type": "registered",
  //       "profile_image": "https://graph.facebook.com/10154831691006272/picture?type=large",
  //       "display_name": "juandiegodc",
  //       "link": "https://stackoverflow.com/users/8534835/juandiegodc"
  //     },
  //     "is_answered": true,
  //     "view_count": 54,
  //     "accepted_answer_id": 61623827,
  //     "answer_count": 2,
  //     "score": 3,
  //     "last_activity_date": 1681021131,
  //     "creation_date": 1588714927,
  //     "question_id": 61623582,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/61623582/efficiently-transforming-data-in-pandas",
  //     "title": "Efficiently transforming data in pandas"
  //   },
  //   {
  //     "tags": [
  //       "r",
  //       "dplyr",
  //       "group-by",
  //       "mutate"
  //     ],
  //     "owner": {
  //       "account_id": 2086517,
  //       "reputation": 379,
  //       "user_id": 1857373,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/2667179d71f9e8e7d4b381c6827e078e?s=256&d=identicon&r=PG",
  //       "display_name": "manager_matt",
  //       "link": "https://stackoverflow.com/users/1857373/manager-matt"
  //     },
  //     "is_answered": false,
  //     "view_count": 16,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021121,
  //     "creation_date": 1681018426,
  //     "last_edit_date": 1681021121,
  //     "question_id": 75968939,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75968939/dyplr-multiple-filters-to-update-derived-field-group-error-to-mutate-derived-fi",
  //     "title": "dyplr multiple filters to update derived field. Group error to mutate derived field. group_by %&gt;% mutate | filter %&gt;% mutate"
  //   },
  //   {
  //     "tags": [
  //       "javascript",
  //       "python",
  //       "html",
  //       "css"
  //     ],
  //     "owner": {
  //       "account_id": 25088270,
  //       "reputation": 1,
  //       "user_id": 18940217,
  //       "user_type": "registered",
  //       "profile_image": "https://lh3.googleusercontent.com/a/AATXAJxM-hxzIgZMODtx_KUnTb_sFlVbmRrXTSBgHH4l=k-s256",
  //       "display_name": "ahmed basrada",
  //       "link": "https://stackoverflow.com/users/18940217/ahmed-basrada"
  //     },
  //     "is_answered": false,
  //     "view_count": 7,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021115,
  //     "creation_date": 1681021115,
  //     "question_id": 75969055,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969055/refresh-the-table",
  //     "title": "Refresh The Table"
  //   },
  //   {
  //     "tags": [
  //       "python",
  //       "installation",
  //       "virtualenv"
  //     ],
  //     "owner": {
  //       "account_id": 28219514,
  //       "reputation": 1,
  //       "user_id": 21570478,
  //       "user_type": "registered",
  //       "profile_image": "https://lh3.googleusercontent.com/a/AGNmyxZWNp7pxtpPSWREjS4GtC1BbgiQMztMxZcLa5M36g=k-s256",
  //       "display_name": "Kangkan",
  //       "link": "https://stackoverflow.com/users/21570478/kangkan"
  //     },
  //     "is_answered": false,
  //     "view_count": 3,
  //     "answer_count": 0,
  //     "score": 0,
  //     "last_activity_date": 1681021105,
  //     "creation_date": 1681021105,
  //     "question_id": 75969054,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75969054/i-am-running-pythons-latest-version-3-11-1-and-when-i-try-to-install-virtual-en",
  //     "title": "I am running python&#39;s latest version 3.11.1 and when I try to install virtual environment it shows something error. How can I solve this problem?"
  //   },
  //   {
  //     "tags": [
  //       "r",
  //       "matrix"
  //     ],
  //     "owner": {
  //       "account_id": 26977277,
  //       "reputation": 21,
  //       "user_id": 21030103,
  //       "user_type": "registered",
  //       "profile_image": "https://lh3.googleusercontent.com/a/ALm5wu3vSZYqQ6uUdqjCpmyjw_CKp4Caf8_FUvUFJ7qY=k-s256",
  //       "display_name": "Cole Hendrickson",
  //       "link": "https://stackoverflow.com/users/21030103/cole-hendrickson"
  //     },
  //     "is_answered": true,
  //     "view_count": 43,
  //     "answer_count": 3,
  //     "score": 1,
  //     "last_activity_date": 1681021098,
  //     "creation_date": 1680990764,
  //     "last_edit_date": 1681021098,
  //     "question_id": 75967852,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75967852/taking-a-diagonal-matrix-to-a-power",
  //     "title": "Taking a diagonal matrix to a power"
  //   },
  //   {
  //     "tags": [
  //       "linux",
  //       "bash",
  //       "scripting"
  //     ],
  //     "owner": {
  //       "account_id": 26236896,
  //       "reputation": 1,
  //       "user_id": 19911881,
  //       "user_type": "registered",
  //       "profile_image": "https://www.gravatar.com/avatar/7f207ab08dd2a5ec97058111a61d954b?s=256&d=identicon&r=PG",
  //       "display_name": "vijayedm",
  //       "link": "https://stackoverflow.com/users/19911881/vijayedm"
  //     },
  //     "is_answered": false,
  //     "view_count": 10,
  //     "answer_count": 1,
  //     "score": 0,
  //     "last_activity_date": 1681021094,
  //     "creation_date": 1681015408,
  //     "last_edit_date": 1681021094,
  //     "question_id": 75968811,
  //     "content_license": "CC BY-SA 4.0",
  //     "link": "https://stackoverflow.com/questions/75968811/extract-multiple-matching-words-with-variable-value-from-a-line",
  //     "title": "Extract multiple matching words with variable value from a line"
  //   },
 