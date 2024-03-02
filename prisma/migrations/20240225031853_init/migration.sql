/*
  Warnings:

  - Added the required column `madeById` to the `Classes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Classes" ADD COLUMN     "madeById" TEXT NOT NULL;
