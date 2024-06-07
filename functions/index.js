/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

// const {onRequest} = require("firebase-functions/v2/https");
// const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

admin.initializeApp();

// Firebase Cloud Function to send email on contact form submission
exports.sendContactEmail = functions.firestore
    .document("contacts/{contactId}")
    .onCreate((snap, context) => {
      const contact = snap.data();

      const transporter = nodemailer.createTransport({
        service: "Gmail",
        auth: {
          user: "abctesting43@gmail.com", // Replace with your Gmail address
          pass: "Kingsman@123", // Replace with your Gmail password
        },
      });

      const mailOptions = {
        from: "YOUR_GMAIL_ADDRESS",
        to: "abctesting43@gmail.com",
        subject: "New Contact Form Submission",
        html: `
        <h3>New Contact Form Submission</h3>
        <ul>
          <li><strong>Name:</strong> ${contact.name}</li>
          <li><strong>Email:</strong> ${contact.email}</li>
          <li><strong>Message:</strong> ${contact.message}</li>
        </ul>
      `,
      };

      return transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
          return console.log("Error sending email:", error);
        }
        console.log("Message sent:", info.response);
        return info.response;
      });
    });
