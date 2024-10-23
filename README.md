# social_media_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Deploying to Vercel

If you want to deploy your app to make it accessible on the internet, you can use Vercel:

### Step 1: Create a Vercel Project

1. Log in to your Vercel account and navigate to the dashboard.
2. Click the **"New Project"** button located at the top right of the dashboard.
3. Choose the Git repository where your Flutter web app is stored and click **"Import."** Vercel will automatically import your project.

### Step 2: Configure Build Settings

Once your project is imported, you need to configure the build settings:

1. Under the **"Build & Development Settings"** section in your Vercel project, choose **"Other"** as the Framework Preset since Flutter is not a default option.
2. Override the default settings with the following:
   - **Build Command**:
     ```bash
     flutter build web --release
     ```
   - **Output Directory**:
     ```plaintext
     build/web
     ```

### Step 3: Deploy Your Flutter Web App

With the build settings configured, you’re ready to deploy:

1. After setting up the build and development settings, click the **"Deploy"** button.
2. Vercel will start the deployment process. You can monitor the progress from the Vercel dashboard.
3. Once the deployment is complete, your Flutter web app will be live on the web and accessible via the provided URL.

## Conclusion

Deploying a Flutter web app to Vercel is a straightforward process that allows you to share your application with a global audience. With Vercel’s user-friendly platform and Flutter's capabilities, you can deliver high-quality web experiences efficiently.

Now that your app is live, be sure to share it with others and make the most of your Flutter development skills!
