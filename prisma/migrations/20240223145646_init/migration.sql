-- CreateTable
CREATE TABLE "Classes" (
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "id" TEXT NOT NULL,

    CONSTRAINT "Classes_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Classes_id_key" ON "Classes"("id");
