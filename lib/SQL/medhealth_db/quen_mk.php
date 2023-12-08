<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve the email from the request
    $email = $_POST['email'];

    // Generate a random OTP (you can customize the length)
    $otp = mt_rand(100000, 999999);

    // TODO: Send the OTP to the user's email (use a mailing library or service)
    // Example using PHP's mail() function (you may need to configure your server for this)
    $subject = "Password Reset OTP";
    $message = "Your OTP for password reset is: $otp";
    $headers = "From: webmaster@example.com";

    // Send email
    $success = mail($email, $subject, $message, $headers);

    if ($success) {
        // If email sent successfully, return success response
        $response['success'] = true;
        $response['message'] = "OTP sent to email successfully";
        $response['otp'] = $otp;
    } else {
        // If email sending fails, return error response
        $response['success'] = false;
        $response['message'] = "Failed to send OTP to email";
    }

    // Convert the response to JSON and echo it
    echo json_encode($response);
} else {
    // If the request method is not POST, return an error response
    $response['success'] = false;
    $response['message'] = "Invalid request method";
    echo json_encode($response);
}
?>
