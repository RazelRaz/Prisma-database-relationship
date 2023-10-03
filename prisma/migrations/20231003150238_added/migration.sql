-- DropForeignKey
ALTER TABLE `product_details` DROP FOREIGN KEY `product_details_product_id_foreign`;

-- CreateTable
CREATE TABLE `product_sliders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `short_des` VARCHAR(500) NOT NULL,
    `price` VARCHAR(100) NOT NULL,
    `image` VARCHAR(200) NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `product_sliders_product_id_unique`(`product_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(50) NOT NULL,
    `otp` VARCHAR(10) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `users_email_unique`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_profiles` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `cus_name` VARCHAR(100) NOT NULL,
    `cus_add` VARCHAR(500) NOT NULL,
    `cus_city` VARCHAR(50) NOT NULL,
    `cus_state` VARCHAR(50) NOT NULL,
    `cus_postcode` VARCHAR(50) NOT NULL,
    `cus_country` VARCHAR(50) NOT NULL,
    `cus_phone` VARCHAR(50) NOT NULL,
    `cus_fax` VARCHAR(50) NOT NULL,
    `ship_name` VARCHAR(100) NOT NULL,
    `ship_add` VARCHAR(100) NOT NULL,
    `ship_city` VARCHAR(100) NOT NULL,
    `ship_state` VARCHAR(100) NOT NULL,
    `ship_postcode` VARCHAR(100) NOT NULL,
    `ship_country` VARCHAR(100) NOT NULL,
    `ship_phone` VARCHAR(50) NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `customer_profiles_user_id_unique`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_wishes` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_carts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `color` VARCHAR(200) NOT NULL,
    `size` VARCHAR(200) NOT NULL,
    `qty` VARCHAR(200) NOT NULL,
    `price` VARCHAR(200) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_reviews` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(1000) NOT NULL,
    `rating` VARCHAR(10) NOT NULL,
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sslcommerz_accounts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `store_id` VARCHAR(255) NOT NULL,
    `store_passwd` VARCHAR(255) NOT NULL,
    `currency` VARCHAR(255) NOT NULL,
    `success_url` VARCHAR(255) NOT NULL,
    `fail_url` VARCHAR(255) NOT NULL,
    `cancel_url` VARCHAR(255) NOT NULL,
    `ipn_url` VARCHAR(255) NOT NULL,
    `init_url` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `policies` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` ENUM('about', 'refund', 'terms', 'how to buy', 'contact', 'complain') NOT NULL,
    `des` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoices` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `total` VARCHAR(50) NOT NULL,
    `vat` VARCHAR(50) NOT NULL,
    `payable` VARCHAR(50) NOT NULL,
    `cus_details` VARCHAR(500) NOT NULL,
    `ship_details` VARCHAR(500) NOT NULL,
    `tran_id` VARCHAR(100) NOT NULL,
    `val_id` VARCHAR(100) NOT NULL DEFAULT '0',
    `delivery_status` ENUM('Pending', 'Processing', 'Completed') NOT NULL,
    `payment_status` VARCHAR(255) NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `invoices_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoice_products` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `invoice_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `qty` VARCHAR(50) NOT NULL,
    `sale_price` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `invoice_products_invoice_id_foreign`(`invoice_id`),
    INDEX `invoice_products_product_id_foreign`(`product_id`),
    INDEX `invoice_products_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `product_details` ADD CONSTRAINT `product_details_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `product_sliders` ADD CONSTRAINT `product_sliders_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `customer_profiles` ADD CONSTRAINT `customer_profiles_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_wishes` ADD CONSTRAINT `product_wishes_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_wishes` ADD CONSTRAINT `product_wishes_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_carts` ADD CONSTRAINT `product_carts_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_carts` ADD CONSTRAINT `product_carts_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_reviews` ADD CONSTRAINT `product_reviews_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customer_profiles`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_reviews` ADD CONSTRAINT `product_reviews_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
