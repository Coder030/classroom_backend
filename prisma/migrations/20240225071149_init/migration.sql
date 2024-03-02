/*
  Warnings:

  - You are about to drop the column `classesId` on the `Members` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Members" DROP CONSTRAINT "Members_classesId_fkey";

-- AlterTable
ALTER TABLE "Members" DROP COLUMN "classesId";

-- CreateTable
CREATE TABLE "MembersOnClasses" (
    "id" TEXT NOT NULL,
    "memberId" TEXT NOT NULL,
    "classesId" TEXT NOT NULL,

    CONSTRAINT "MembersOnClasses_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "MembersOnClasses_id_key" ON "MembersOnClasses"("id");

-- AddForeignKey
ALTER TABLE "MembersOnClasses" ADD CONSTRAINT "MembersOnClasses_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Members"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MembersOnClasses" ADD CONSTRAINT "MembersOnClasses_classesId_fkey" FOREIGN KEY ("classesId") REFERENCES "Classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
