-- CreateTable
CREATE TABLE "Members" (
    "name" TEXT NOT NULL,
    "id" TEXT NOT NULL,
    "classesId" TEXT,

    CONSTRAINT "Members_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Members_id_key" ON "Members"("id");

-- AddForeignKey
ALTER TABLE "Members" ADD CONSTRAINT "Members_classesId_fkey" FOREIGN KEY ("classesId") REFERENCES "Classes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
