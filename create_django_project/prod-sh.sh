PROJECT_NAME=$1
APP_NAME=$2
SPTH="${PWD}"
django-admin startproject $PROJECT_NAME
cd $PROJECT_NAME
mkdir apps && touch ./apps/__init__.py
cd apps
django-admin startapp $APP_NAME
cd $APP_NAME
mkdir templates templates/$APP_NAME
touch templates/$APP_NAME/index.html
code -n templates/$APP_NAME/index.html
mkdir static static/$APP_NAME
cd $SPTH
code './'$PROJECT_NAME'/'$PROJECT_NAME'/settings.py'
sed -i "34i\    'apps."$APP_NAME"'," './'$PROJECT_NAME'/'$PROJECT_NAME'/settings.py'

code './'$PROJECT_NAME'/'$PROJECT_NAME'/urls.py'
cp './'$PROJECT_NAME'/'$PROJECT_NAME'/urls.py' './'$PROJECT_NAME'/apps/'$APP_NAME'/urls.py'
code './'$PROJECT_NAME'/apps/'$APP_NAME'/urls.py'
code './'$PROJECT_NAME'/apps/'$APP_NAME'/views.py'
# cd $SPTH