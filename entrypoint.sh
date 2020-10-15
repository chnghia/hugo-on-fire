# Displaying versions
node -v
hugo version

# Get Firebase Token
if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "FIREBASE_TOKEN is missing." /
    echo "You can get it using command 'firebase login:ci' and then set it in Github Secrets as FIREBASE_TOKEN variable."
    exit 1
fi

# install packages
npm install

# Generate hugo site
npm run start

# Deploy it on Firebase
firebase use --token "${FIREBASE_TOKEN}"
firebase deploy --non-interactive --token "${FIREBASE_TOKEN}"
