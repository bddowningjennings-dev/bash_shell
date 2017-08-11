PROJECT_NAME=$1
APP_NAME=$2
SPTH="${PWD}"

# create project from the value of the first arg
django-admin startproject $PROJECT_NAME

cd $PROJECT_NAME
mkdir apps && touch ./apps/__init__.py
cd apps

# create first app from the value of the second arg
django-admin startapp $APP_NAME
cd $APP_NAME

# create/copy the static and template folders/files within app specific sub folders
mkdir templates templates/$APP_NAME
cp ~/Dev/Shell/create_django_project/resources/index.html templates/$APP_NAME/index.html
code -n templates/$APP_NAME/index.html
mkdir static static/$APP_NAME
cd $SPTH

# prep the url links for the project and app levels
sed -i "34i\    'apps."$APP_NAME"'," './'$PROJECT_NAME'/'$PROJECT_NAME'/settings.py'
sed -i "20i\    url(r'^', include('apps."$APP_NAME".urls')),"  './'$PROJECT_NAME'/'$PROJECT_NAME'/urls.py'
sed -i "16i\from django.conf.urls import include"  './'$PROJECT_NAME'/'$PROJECT_NAME'/urls.py'

# copy basic app level urls
cp ~/Dev/Shell/create_django_project/resources/app_urls.py './'$PROJECT_NAME'/apps/'$APP_NAME'/urls.py'

# create default views that renders basic index.html
sed -i "6i\    return render(request, '"$APP_NAME"/index.html')" './'$PROJECT_NAME'/apps/'$APP_NAME'/views.py'
sed -i "6i\def index(request):" './'$PROJECT_NAME'/apps/'$APP_NAME'/views.py'

# open the key files to build out within the project
code './'$PROJECT_NAME'/'$PROJECT_NAME'/settings.py'
code './'$PROJECT_NAME'/'$PROJECT_NAME'/urls.py'
code './'$PROJECT_NAME'/apps/'$APP_NAME'/urls.py'
code './'$PROJECT_NAME'/apps/'$APP_NAME'/views.py'
code './'$PROJECT_NAME
# start server & render basic index.html
python $PROJECT_NAME'/manage.py' runserver



